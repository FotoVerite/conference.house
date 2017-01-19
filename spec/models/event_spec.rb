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

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
