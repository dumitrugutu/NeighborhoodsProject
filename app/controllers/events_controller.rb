class EventsController < ApplicationController

def index
  @events = Event.all
  @event = Event.new
end

def show
end

def new
  @event = Event.new
end

def edit
end


end
