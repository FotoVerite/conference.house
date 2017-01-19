# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  user_id        :integer
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
#  slug           :string
#  listing_count  :integer          default(0)
#  lfr_count      :integer          default(0)
#  hr_count       :integer          default(0)
#  flag_count     :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do

  factory :event do
    user
    name { FFaker::Company.bs }
    venue_name {FFaker::Venue.name}
    website {FFaker::Internet.domain_name}
    country {FFaker::Address.country}
    state {FFaker::AddressUS.state}
    city {FFaker::AddressUS.city}
    street_address {FFaker::AddressUS.street_address}
    postal_code {FFaker::AddressUS.zip_code}
    lat {FFaker::Geolocation.lat}
    start_date {Date.today + rand(0...200).days}
    end_date {start_date + rand(0...4).days}
    lng {FFaker::Geolocation.lng}
  end

end
