class Staff::FlagsController < StaffController

  def index
    @unchecked_listings = Listing.joins(:flags).where('flags.status is NULL').group("listings.id").order("count(flags.id) desc")
    @count = @unchecked_listings.length
  end
end
