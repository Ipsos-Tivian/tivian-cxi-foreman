require "foreman"

class Foreman::Process

  attr_reader :entry
  attr_reader :num
  attr_reader :pid

  def initialize(entry, num)
    @entry = entry
    @num = num
  end

  def run(pipe, basedir, environment)
    Dir.chdir(basedir) do
      with_environment(environment) do
        io = IO.popen(["/Users/david/Code/foreman/bin/runner", "#{entry.command}"], "w+")
        @pid = io.pid
        trap("SIGTERM") { "got sigterm for %d" % @pid }
        output pipe, "started with pid %d" % @pid
        Thread.new do
          until io.eof?
            output pipe, io.gets
          end
        end
      end
    end
  end

  def name
    "%s.%s" % [ entry.name, num ]
  end

private

  def output(pipe, message)
    pipe.puts "%s,%s" % [ name, message ]
  end

  def replace_command
  end

  def with_environment(environment)
    old_env = ENV.each_pair.inject({}) { |h,(k,v)| h.update(k => v) }
    environment.each { |k,v| ENV[k] = v }
    ret = yield
    ENV.clear
    old_env.each { |k,v| ENV[k] = v}
    ret
  end

end
