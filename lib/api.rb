require 'random_range'
class Draw::API < Grape::API
  rescue_from :all
  error_format :json
  
  use Rack::Parser
  
  prefix 'api'
  version 'v1', :using => :path, :vendor => 'winnr', :format => :json
  
  resource 'draw' do
  
  	get :all do
  		Draw.all
  	end
  
    post '/' do

    	@draw = Draw.new(params[:draw])

    	if @draw.draw_type == 'instant'
    		now = Time.now
    		selection_range = (now-12.hours)..(now+12.hours)
    		puts selection_range
    		random_time = rand_time(@draw.start_date, @draw.end_date)
    		puts random_time
    		if selection_range === random_time
    			@draw.selection = "WINNER"
    			puts "WINNER"
    		else
    			@draw.selection = "NOT WINNER"
    			puts "NOT WINNER"
    		end
	    end
	    
	    if @draw.draw_type == 'group'

	    end
	    
	    if @draw.save
				@draw
			else
				@draw.errors
			end
    end

    get ':id' do
      Draw.find(params[:id])
    end
  end
    
end

