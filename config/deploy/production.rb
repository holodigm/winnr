
set :branch, 'master'
role :web, "211.26.139.55"                          # Your HTTP server, Apache/etc
role :app, "211.26.139.55"                          # This may be the same as your `Web` server
role :db,  "211.26.139.55", :primary => true # This is where Rails migrations will run
