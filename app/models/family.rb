class Family < ApplicationRecord

	has_many :people

	validates :name, presence: true

	after_destroy :update_people
 
  def update_people
  	people = Person.where(:family_id => self.id)

		if people.count == 0
			return
		end

		@general_family = Family.where(:name => 'عام')

		if @general_family.count != 0
			general_id = @general_family.first.id
		else
			@general_family = Family.new(:name => 'عام')
			@general_family.save
			general_id = @general_family.id
		end


		people.each do |person|
			person.family_id = general_id
			person.save
		end
	end

end
