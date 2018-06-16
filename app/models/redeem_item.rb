class RedeemItem < ApplicationRecord
	validates :name, presence: true


	def name_with_points
    	"#{name}  #{cost}"
  	end
end
