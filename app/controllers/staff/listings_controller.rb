class Staff::ListingsController < ApplicationController

  def confirm_flags
    @listing = Listing.find(params[:id])
    attributes = {status: params[:status], admin_id: current_admin.id}
    @listing.flags.update_all(attributes)
    if params[:status] == Flag::STATUS[0]
      @listing.update_attributes({ flags_confirmed: true, flags_confirmed_at: Time.now})
    else
      @listing.update_attributes(flag_count: 0)
    end
  end

end
