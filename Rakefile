task :exec do
  desc "start server"
  sh "bundle exec thin start -C config/thin.yml --socket /tmp/thin/tg.sock"
end

task :stop do
  desc "stop server"
  sh "bundle exec thin stop -C config/thin.yml --socket /tmp/thin/tg.sock"
end

task :default => :exec

