set :stages, %w(testing uat staging production )
set :default_stage, "uat"
require 'capistrano/ext/multistage'

set :application, "winnr"
set :deploy_to, "/var/www/apps/winnr"

set :scm, :git
set :scm_verbose,true
set :git_shallow_clone, 1
set :user, 'sysadmin'
set :port, '22'
set :use_sudo, true
set :repository,  "git@github.com:holodigm/winnr.git"
set :keep_releases, 5

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
 #   run "cd #{deploy_to}/current"
 #   run "rvm use 1.9.3"
 #   run "bundle install"
 #   run "start-stop-daemon --stop -n nginx"
 #   run "passenger start -a 127.0.0.1 -p 3001 -d -e #{environment}"
  end
end

