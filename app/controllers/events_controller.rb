class EventsController < ApplicationController
  # in the tutorial the below was authenticate_user!, i hope the difference in terms doesn't cause any problems
  before_action :authenticate_group_rep!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

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
