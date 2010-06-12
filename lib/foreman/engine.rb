require "foreman"
require "foreman/process"
require "tempfile"

class Foreman::Engine

  attr_reader :procfile
  attr_reader :directory

  def initialize(procfile)
    @procfile  = read_procfile(procfile)
    @directory = File.expand_path(File.dirname(procfile))
  end

  def processes
    @processes ||= begin
      procfile.split("\n").inject({}) do |hash, line|
        next if line.strip == ""
        process = Foreman::Process.new(*line.split(" ", 2))
        hash.update(process.name => process)
      end
    end
  end

  def start
    proctitle "ruby: foreman master"

    processes.each do |name, process|
      fork process
    end

    trap("TERM") { kill_and_exit("TERM") }
    trap("INT")  { kill_and_exit("INT")  }

    run_loop
  end

  def screen
    tempfile = Tempfile.new("foreman")
    tempfile.puts "sessionname foreman"
    processes.each do |name, process|
      tempfile.puts "screen -t #{name} #{process.command}"
    end
    tempfile.close

    system "screen -c #{tempfile.path}"

    tempfile.delete
  end

  def execute(name)
    run(processes[name], false)
  end

private ######################################################################

  def fork(process)
    pid = Process.fork do
      run(process)
    end

    info "started with pid #{pid}", process
    running_processes[pid] = process
  end

  def run(process, log_to_file=true)
    proctitle "ruby: foreman #{process.name}"

    Dir.chdir directory do
      FileUtils.mkdir_p "log"
      command = process.command
      command << " >>log/#{process.name}.log 2>&1" if log_to_file
      system command
      exit $?.exitstatus || 255
    end
  end

  def kill_and_exit(signal="TERM")
    info "termination requested"
    running_processes.each do |pid, process|
      info "killing pid #{pid}", process
      Process.kill(signal, pid)
    end
    exit 0
  end

  def info(message, process=nil)
    puts "[foreman] [#{Time.now.utc}] [#{process ? process.name : "system"}] #{message}"
  end

  def print_info
    info "currently running processes:"
    running_processes.each do |pid, process|
      info "pid #{pid}", process
    end
  end

  def proctitle(title)
    $0 = title
  end

  def read_procfile(procfile)
    File.read(procfile)
  end

  def run_loop
    while true
      pid, status = Process.wait2
      process = running_processes.delete(pid)
      info "exited with code #{status}", process
      fork process
    end
  end

  def running_processes
    @running_processes ||= {}
  end

end
