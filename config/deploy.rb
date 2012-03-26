set :application, "winnr"
set :deploy_to, "/var/www/apps/winnr"
set :repository,  "git@github.com:holodigm/winnr.git"

set :scm, :git
set :scm_verbose,true
set :git_shallow_clone, 1
set :user, 'sysadmin'
set :port, '22'
set :use_sudo, true
set :keep_releases, 5

task :uat do
  role :web, "211.26.139.57"
  role :app, "211.26.139.57"
  role :db,  "211.26.139.57", :primary => true
end

task :production do
  role :web, "211.26.139.55"
  role :app, "211.26.139.55"
  role :db,  "211.26.139.55", :primary => true
end

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

# Install after hooks for deployment.
after "deploy", "deploy:cleanup"
