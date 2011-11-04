$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require 'rvm/capistrano'
require 'bundler/capistrano'


set :application, "sambhrama"
set :repository,  "git://github.com/EazeeNet/sambhrama.git"

set :scm, :git

set :user, "sambhrama"
set :rvm_type, :user
set :rvm_ruby_string, '1.9.2'
set :deploy_to, "/home/sambhrama/apps/"
set :use_sudo, false
set :keep_releases, 5

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#set :default_environment, {
#  'PATH' => "/usr/local/rvm/gems/ruby-1.9.2-p290@global/bin/:$PATH"
#}


role :web, "178.18.124.18"                          # Your HTTP server, Apache/etc
role :app, "178.18.124.18"                          # This may be the same as your `Web` server
role :db,  "178.18.124.18", :primary => true # This is where Rails migrations will run
role :db,  "178.18.124.18"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
 
 task :symlink_database_yml do
  run "rm #{release_path}/config/database.yml"
  run "ln -sfn #{shared_path}/config/database.yml  #{release_path}/config/database.yml"
 end

after "bundle:install", "symlink_database_yml"
