class CollegesController < ApplicationController
  before_action :set_college, only: [:edit, :update, :destroy]

  def index
    @colleges = College.all
  end

  # GET /colleges/new
  def new
    @college = College.new
  end

  # GET /colleges/1/edit
  def edit
  end

  def create
    @college = College.new(college_params)

    respond_to do |format|
      if @college.save
        format.html { redirect_to colleges_path, notice: 'College was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @college.update(college_params)
        format.html { redirect_to colleges_path, notice: 'College was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @college.destroy
    respond_to do |format|
      format.html { redirect_to colleges_url, notice: 'College was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_college
      @college = College.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def college_params
      params.require(:college).permit(:name)
    end
end
