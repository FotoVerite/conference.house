class EventsController < ApplicationController

  def index
    @events = Event.current.includes(:listings).order("start_date ASC")
  end

end
