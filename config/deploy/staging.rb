
set :branch, 'staging'
role :web, "210.50.2.198"                          # Your HTTP server, Apache/etc
role :app, "210.50.2.198"                          # This may be the same as your `Web` server
role :db,  "210.50.2.198", :primary => true # This is where Rails migrations will run