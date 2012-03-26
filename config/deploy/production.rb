
set :branch, 'master'
role :web, "192.168.1.8"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.8"                          # This may be the same as your `Web` server
role :db,  "192.168.1.8", :primary => true # This is where Rails migrations will run
