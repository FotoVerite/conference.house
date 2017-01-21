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
#  flag_count     :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Listing, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
