class Event < ApplicationRecord

	has_many :records, dependent: :destroy

	validates :name, presence: true
	validates :points, presence: true

	def name_with_points
    	"#{name}  #{points}"
  	end
end
