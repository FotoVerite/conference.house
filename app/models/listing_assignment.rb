# == Schema Information
#
# Table name: listing_assignments
#
#  id         :integer          not null, primary key
#  listing_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ListingAssignment < ApplicationRecord
  belongs_to :listing
  belongs_to :user
end
