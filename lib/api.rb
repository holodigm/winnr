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
    	hs = @draw.hit_size

    	if @draw.draw_type == 'instant'
    		#get the entry time
    		now = Time.now
    		#get your hit target
    		selection_range = (now-hs.minutes)..(now+hs.minutes)
    		#select a random time across the draw time range
    		random_time = rand_time(@draw.start_date, @draw.end_date)
    		if selection_range.cover?(random_time)
    			@draw.selection = "WINNER"
    		else
    			@draw.selection = "NOT WINNER"
    		end
	    end
	    
	    if @draw.draw_type == 'group'
	        @draw.selection = @draw.params.sort_by{rand}[0..@draw.major_draw_size]
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

