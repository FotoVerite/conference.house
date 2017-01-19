# == Schema Information
#
# Table name: listings
#
#  id             :integer          not null, primary key
#  event_id       :integer
#  name           :string
#  description    :text
#  hotel          :string
#  listing_type   :string
#  country        :string
#  state          :string
#  city           :string
#  street_address :string
#  postal_code    :string
#  price          :string
#  lat            :decimal(10, 6)
#  lng            :decimal(10, 6)
#  slug           :string
#  flag_count     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do

  factory :listing do
    event_id {FactoryGirl.create(:event).id}
    name { FFaker::Company.bs }
    description {FFaker::HipsterIpsum.paragraph}
    hotel {FFaker::Venue.name}
    country {FFaker::Address.country}
    state {FFaker::AddressUS.state}
    city {FFaker::AddressUS.city}
    street_address {FFaker::AddressUS.street_address}
    postal_code {FFaker::AddressUS.zip_code}
    price {Listing::PRICE[rand(0..4)]}
    listing_type { Listing::TYPES[rand(0...Listing::TYPES.length)]}
    transient do
        users {rand(1..3)}
    end
    after(:create) do |listing, evaluator|
        create_list(:user, evaluator.users, listings: [listing])
    end
  end

end
