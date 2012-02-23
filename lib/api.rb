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
    		if @draw.save
			    @draw
			  else
			    @draw.errors
			  end
	    end
	    
	    if @draw.draw_type == 'group'
	    	if @draw.save
			    @draw
			  else
			    @draw.errors
			  end
	    end
    end

    get ':id' do
      Draw.find(params[:id])
    end
  end
    
end
