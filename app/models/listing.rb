# == Schema Information
#
# Table name: listings
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  hotel       :string
#  country     :string
#  state       :string
#  city        :string
#  address     :string
#  postal_code :string
#  price       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Listing < ApplicationRecord
  has_many :listing_assignments, dependent: :destroy
  has_many :users, through: listing_assignments
end
