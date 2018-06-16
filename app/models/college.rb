class College < ApplicationRecord

  has_many :people

  validates :name, presence: true


  after_destroy :update_people
 
  def update_people

  	people = Person.where(:college_id => self.id)

	if people.count == 0
		return
	end

	@general_college = College.where(:name => 'عام')

	if @general_college.count != 0
		general_id = @general_college.first.id
	else
		@general_college = College.new(:name => 'عام')
		@general_college.save
		general_id = @general_college.id
	end


	people.each do |person|
		person.college_id = general_id
		person.save
	end
  end


end
