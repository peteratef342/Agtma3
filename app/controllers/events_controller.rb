class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end


  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end


  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_url, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_url, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    records = Record.where(:event_id => @event.id)
    
    records.each do |record|
      person = record.person;
      person.points = person.points - record.points
      person.save
    end

    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :points)
    end
end
