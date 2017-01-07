# == Schema Information
#
# Table name: admins
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do

  factory :admin do |a|
    a.first_name { FFaker::Name.first_name }
    a.last_name { FFaker::Name.last_name }
    a.username { FactoryGirl.generate(:username) }
    a.email { FactoryGirl.generate(:email) }
    a.password 'password'
  end

end
