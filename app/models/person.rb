class Person < ApplicationRecord
	belongs_to :family
	belongs_to :college
	#belongs_to :system

	has_many :records , dependent: :destroy
	validates :name, presence: true


end
