class EventsController < ApplicationController
  def index
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
  end
  
  def create
    @event = Event.create!(event_params)
    flash[:notice] = "#{@event.name} was created successfully."
    redirect_to group_rep_events_path
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update!(event_params)
    flash[:notice] = "#{@event.name} was successfully updated."
    redirect_to group_rep_event_path
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event #{@event.name} deleted"
    redirect_to group_rep_events_path
  end
  
  private
  
  def event_params
    params.require(:event).permit(:group_rep_id, :name, :organizer_contact_info, 
                                    :event_time, :is_free, :location)
  end
end