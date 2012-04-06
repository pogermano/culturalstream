require 'bundler/capistrano'

server "33.33.13.37", :web, :app, :db, primary:  true

set :application, "culturalstream"
set :user, "vagrant"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false


set :scm, :git
set :repository,  "git@github.com:pogermano/culturalstream.git"
set :branch, "master"


default_run_options[:pty] = true
ssh_options[:forward_agent] = true


set :rails_env,       "production"


namespace :deploy do
  task :start do; end
  task :stop do; end
  task :restart, roles: :app, except: {no_release: true} do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/apache.conf /etc/apache2/sites-available/#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

task :sphinx_config, roles: :app do
    puts "        ##################### sphinx ############################"
    run "cd #{release_path} && bundle exec rake ts:config --trace RAILS_ENV=production"
    run "cd #{release_path} && bundle exec rake ts:rebuild --trace RAILS_ENV=production"
    run "cd #{release_path} && bundle exec rake ts:in --trace RAILS_ENV=production"
    puts "        ##################### sphinx ############################"
  end
  after "deploy:migrate","deploy:sphinx_config"


 task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end
