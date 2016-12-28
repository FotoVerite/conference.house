# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  name           :string
#  website        :string
#  country        :string
#  state          :string
#  city           :string
#  street_address :string
#  postal_code    :string
#  lat            :decimal(10, 6)
#  lng            :decimal(10, 6)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Event < ApplicationRecord
  has_many :listings
end
