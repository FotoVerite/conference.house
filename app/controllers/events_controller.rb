class EventsController < ApplicationController
  serialization_scope :view_context

  def index
    @events = Event.current.includes(:listings).order("start_date ASC")
  end

  def new
    @event = Event.new(event_params)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event was successfully created."
      redirect_to new_event_listing_path(@event)
    else
      render('new')
    end
  end

  private

  def event_params
    params.require(:event).permit(
      "name",
      "website",
      "venue_name",
      "country",
      "state",
      "city",
      "street_address",
      "postal_code",
      "start_date",
      "end_date",
      "lat",
      "lng"
    )
  end

end