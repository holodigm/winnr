
task :test_instant => :environment do
  require 'json'
  require 'uri'
  require 'rest-client'
	i=1
	url ="https://winnr.api:7443/api/v1/draw"
	while (1..10000) do


		response = RestClient.post url, :draw => { :competition_code => 'comp12',
																								:code => "draw#{i}",
																								:draw_type => 'instant',
																								:hit_size => 30,
																								:start_date => Time.now.beginning_of_day(),
																								:end_date => Time.now.beginning_of_day() + 7.days }

		@data = ActiveSupport::JSON.decode(response)
		puts @data.to_yaml
		
		i = i+1
		
	end

end
