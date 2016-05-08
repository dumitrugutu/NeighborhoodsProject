class EventsController < ApplicationController
  def index
  end
  
  def show
    id = params[:id]
    @event = Event.find(id)
  end
  
  def new
  end
end