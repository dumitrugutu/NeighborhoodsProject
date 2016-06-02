class EventsController < ApplicationController
  before_action :authenticate_group_rep!
  before_action :verify_group_rep
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(['group_rep_id = ?', params[:group_rep_id]])
  end

  def show
  end

  def new
    @group_rep = GroupRep.find(params[:group_rep_id])
    @event = Event.new
  end

  def edit
    @group_rep = GroupRep.find(params[:group_rep_id])
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.group_rep_id = params[:group_rep_id]
    @event.save
    
    flash[:notice] = "#{@event.name} was created successfully."
    redirect_to group_rep_events_path
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
  
  def set_post
    @event = Event.find(params[:id])
  end
  
  def verify_group_rep
    if current_group_rep.id.to_s != params[:group_rep_id]
      redirect_to '/'
    end
  end
end