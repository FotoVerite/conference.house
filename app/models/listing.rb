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
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Listing < ApplicationRecord
  has_many :listing_assignments, dependent: :destroy
  has_many :users, through: :listing_assignments

  TYPES = [
    "looking for room",
    "have room"
  ]

  def short_type_name
    if type == TYPES[0]
      return 'lfr'
    elsif type == TYPES[1]
      return 'hr'
    end
  end

end
