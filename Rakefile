require 'dotenv'
Dotenv.load

desc 'Run server'
task :server do
  sh 'bundle exec puma -t 1:1 -p %PORT%'
end