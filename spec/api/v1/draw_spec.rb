require 'spec_helper'

describe Draw::API do

	describe "POST creating a draw" do
		let(:url) { "/api/v1/draw" }
		it "successful JSON" do
			post "#{url}",
				:draw => {
				:code => "draw1",
				:competition_code => "comp1"
			}
			draw = Draw.find_by_code("draw1")
			route = "/api/v1/draw/#{draw.id}"
			last_response.status.should eql(201)
			last_response.headers["Location"].should eql(route)
			last_response.body.should eql(draw.to_json)
		end
	end
	
  describe "GET /api/v1/draw/1" do
    it "returns an array of draws" do
      get "/api/v1/draw/1"
      response.status.should == 200
      JSON.parse(response.body).should == '{"code":"draw1","competition_code":"comp1","created_at":"2012-02-23T00:25:15Z","draw_type":"selection_set","id":1,"parameters":"[abcd,dcba]","selection":"","updated_at":"2012-02-23T00:25:15Z"}'
    end
  end
  
end


