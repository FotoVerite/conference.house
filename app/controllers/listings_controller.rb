class ListingsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @listings = @event.listings
  end

end
