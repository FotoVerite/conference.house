# == Schema Information
#
# Table name: flags
#
#  id             :integer          not null, primary key
#  type_of_flag   :string
#  status         :string
#  flaggable_type :string
#  flaggable_id   :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Flag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
