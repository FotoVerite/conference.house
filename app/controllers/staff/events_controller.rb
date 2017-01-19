class Staff::EventsController < StaffController

  def index
     @events = Event.page params[:page]
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(admin_params)
    if @event.save
      flash[:notice] = "Event was successfully created."
      redirect_to staff_admins_path
    else
      render('new')
    end
  end

  def show
    @event = Event.find(params[:id])
    @flagged_listings = @event.listings.where('flag_count > 0')
  end

  def merge
    @event = Event.find(params[:id])
    @events = Event.current.order('Name ASC') - [@event]
  end

  def edit
    @event = Event.find(params[:id])
  end

  # standard edit action
  # also updates @admin.permissons.
  def update
    @event = Event.find(params[:id])
    # Only values that are in protected_controllers are valid
    if @event.update_attributes(admin_params)
      @event.update_permissions(new_permissions)
      flash[:notice] = "Event was successfully updated."
      redirect_to staff_events_path
    else
      render('edit')
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:notice] = "Event was successfully deleted."
    redirect_to staff_events_path
  end

  private

  def admin_params
    params.require(:event).permit(
      "email",
      "first_name",
      "last_name",
      "password",
      "eventname",
      "previous_password",
      "email_confirmation",
      "password_confirmation"
    )
  end

end
