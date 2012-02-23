class Draw < ActiveRecord::Base

	validates :competition_code, :code, :draw_type, :presence => true
	validates :code, :uniqueness => true
	
end
