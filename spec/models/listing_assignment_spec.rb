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

require 'rails_helper'

RSpec.describe ListingAssignment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
