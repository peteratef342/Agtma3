class HomeController < ApplicationController
  
  def search

  	query = ""

  	if params[:person]
  	  @person = Person.new(person_params)
  	  start = false
  	  if params[:person][:mobile] != ""
  	  	start = true
  	  	query+= "mobile like '%#{params[:person][:mobile]}%'"
  	  end

  	  if params[:person][:family_id] != ""
  	  	if start
  	  	  query += " and "
  	  	end
  	  	start = true
  	  	query+= "family_id = #{params[:person][:family_id]}"
  	  end
  	  
  	  if params[:person][:college_id] != ""
  	  	if start
  	  	  query += " and "
  	  	end
		start = true
  	  	query+= "college_id = #{params[:person][:college_id]}"
  	  end

  	  if params[:person][:name] != ""
  	  	if start
  	  	  query += " and "
  	  	end
		start = true
  	  	query+= "name like '%#{params[:person][:name]}%'"
  	  end

  	  if params[:person][:points] != "" and params[:person][:points] != "0"
  	  	if start
  	  	  query += " and "
  	  	end
		start = true
  	  	query+= "points >= #{params[:person][:points]}"
  	  end


  	  @people = Person.where(query)

  	else
  	   @person = Person.new
  	end


  end
  

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :points, :mobile, :birthdate, :family_id, :college_id)
    end
  
end
