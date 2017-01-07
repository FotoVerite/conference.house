# == Schema Information
#
# Table name: users
#
#  id                        :integer          not null, primary key
#  first_name                :string(50)
#  last_name                 :string(50)
#  username                  :string
#  email                     :string
#  password_digest           :string           default(""), not null
#  enabled                   :boolean          default(TRUE)
#  remember_token            :string(40)
#  remember_token_expires_at :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

FactoryGirl.define do

  factory :user do |u|
    u.first_name { FFaker::Name.first_name }
    u.last_name { FFaker::Name.last_name }
    u.username { FactoryGirl.generate(:username) }
    u.email { FactoryGirl.generate(:email) }
    u.password 'password'
  end

end
