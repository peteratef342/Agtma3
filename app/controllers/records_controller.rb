class RecordsController < ApplicationController
  before_action :set_record, only: [:destroy]


  def create
    @record = Record.new(record_params)
    @event = Event.find(record_params[:event_id])
    @record.points = @event.points
    @person = @record.person
    if @record.points
      @person.points = @person.points + @record.points
    end
    respond_to do |format|
      if @record.points and @record.save and @person.save
        format.html { redirect_to @record.person, notice: 'Record was successfully created.' }
      else
        format.html { redirect_to @record.person, notice: "Can't create Record." }
      end
    end
  end

  def destroy
    @record.destroy
    @person = @record.person
	@person.points = Record.where(:person_id => @person.id).sum(:points)
    @person.save
	
    
    respond_to do |format|
      format.html { redirect_to @record.person , notice: 'Record was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:person_id, :event_id)

    end
end
