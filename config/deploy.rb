$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) 
#require 'rvm/capistrano'
require 'bundler/capistrano'

set :application, "culturalstream"
set :repository,  "git@github.com:pogermano/culturalstream.git"

set :rails_env,       "production"

set :scm, :git

role :web, "173.230.137.11"           
role :app, "173.230.137.11"                     
role :db,  "173.230.137.11", :primary => true

set :user, "app"
set :deploy_to, "/home/app/apps/#{application}"

set :use_sudo, false

set :keep_releases, 5
ssh_options[:forward_agent] = true





role :web, "173.230.137.11"                          # Your HTTP server, Apache/etc
role :app, "173.230.137.11"                          # This may be the same as your `Web` server
role :db,  "173.230.137.11", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

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

#task :symlink_database_yml do
#  run "rm #{release_path}/config/database.yml"
#  run "ln -sfn #{shared_path}/config/database.yml 
#       #{release_path}/config/database.yml"
#end
#after "bundle:install", "symlink_database_yml"
