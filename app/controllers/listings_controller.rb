class ListingsController < ApplicationController
  before_action :confirm_user_logged_in, except: [:index, :show]

  def index
    @event = Event.find(params[:event_id])
    @listings = @event.listings.where(flags_confirmed: false).where('listings.id not in(?)', current_user.try(:flagged_listing_ids).try(:push, 0) || [0])
    @user_listing_ids = @current_user.try(:listing_ids) || [0]
  end

  def new
    @event = Event.find(params[:event_id])
    @listing = @event.listings.new
  end

  def create
    @event = Event.find(params[:event_id])
    @listing = @event.listings.new(listing_params)
    @listing.user_ids = [current_user.id]
    if @listing.save
      flash[:notice] = "Listing was successfully created."
      redirect_to event_listings_path(@event)
    else
      render('new')
    end
  end

  def flag
    @listing = Listing.find(params[:listing_id])
    @listing.flags.create(user: current_user, type_of_flag: params[:flag_type])
  end

  def edit
    @listing = current_user.listings.find(params[:id])
  end

  def update
    @listing = current_user.listings.find(params[:id])
    @listing.attributes(listing_params)
    if @listing.save
      flash[:notice] = "Listing was successfully updated."
      redirect_to event_listings_path(@listing.event_id)
    else
      render('edit')
    end
  end

  def destroy
    listing = current_user.listings.find(params[:id])
    if @listing.destroy
      flash[:notice] = "Listing was successfully removed."
      redirect_to event_listings_path(listing.event_id)
    end
  end


  private

  def listing_params
    params.require(:listing).permit(
      "name",
      "description",
      "listing_type",
      "price",
      "hotel",
      "country",
      "state",
      "city",
      "street_address",
      "postal_code",
      "lat",
      "lng"
    )
  end

end
