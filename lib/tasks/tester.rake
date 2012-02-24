
task :test_instant => :environment do
  require 'json'
  require 'uri'
  require 'rest-client'
	i=1
	url ="http://localhost:3000/api/v1/draw"
	while (1..10000) do

		puts "BOOM!"
		response = RestClient.post url, :draw => { :competition_code => 'comp5',
																								:code => "draw#{i}",
																								:draw_type => 'instant',
																								:start_date => Time.now.beginning_of_day(),
																								:end_date => Time.now.beginning_of_day() + 7.days }
		puts response
		
		i = i+1
		
	end

end
