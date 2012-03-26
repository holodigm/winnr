
set :branch, 'uat'
role :web, "211.26.139.57"                          # Your HTTP server, Apache/etc
role :app, "211.26.139.57"                          # This may be the same as your `Web` server
role :db,  "211.26.139.57", :primary => true # This is where Rails migrations will run
