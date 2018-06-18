class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
  
    @person = Person.new
  
    if params[:person] and params[:person][:family_id] != ""
       @people = Person.where(:family_id => params[:person][:family_id])
	  else
      @people = Person.all
    end
	
    puts params
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @records = Record.where(:person_id => @person.id)
    @redeem_records = RedeemRecord.where(:person_id => @person.id)
    @record = Record.new
	  @redeem_record = RedeemRecord.new 
	  @redeems = RedeemItem.where("cost <= ?",  @person.points)
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
       else
        format.html { render :new }
       end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :points, :mobile, :birthdate, :family_id, :college_id,:address)
    end
end
