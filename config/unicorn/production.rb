@app_path = '/home/joe/pg-web'
working_directory @app_path + "/current"

worker_processes 2
preload_app true
timeout 30
listen 3030
pid "#{@app_path}/shared/tmp/pids/unicorn.pid"

stderr_path "#{@app_path}/shared/log/unicorn.stderr.log"
stdout_path "#{@app_path}/shared/log/unicorn.stdout.log"

before_fork do |server, worker|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('Gemfile', ENV['RAILS_ROOT'])
end

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end
