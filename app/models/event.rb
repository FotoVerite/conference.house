# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  name           :string
#  website        :string
#  venue_name     :string
#  country        :string
#  state          :string
#  city           :string
#  street_address :string
#  postal_code    :string
#  start_date     :date
#  end_date       :date
#  lat            :decimal(10, 6)
#  lng            :decimal(10, 6)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Event < ApplicationRecord
  has_many :listings
  has_many :looking_for_listings, -> {where('listings.listing_type = ?', Listing::TYPES[0])}, class_name: 'Listing'
  has_many :have_listings, -> {where('listings.listing_type = ?', Listing::TYPES[1])}, class_name: 'Listing'

  scope :current, -> {where('events.end_date' < Date.today.to_s(:db))}

end
