# == Schema Information
#
# Table name: users
#
#  id                        :integer          not null, primary key
#  first_name                :string
#  last_name                 :string
#  username                  :string
#  email                     :string
#  password_digest           :string           default(""), not null
#  enabled                   :boolean          default(TRUE)
#  validated                 :boolean          default(TRUE)
#  email_validation_token    :string
#  remember_token            :string
#  remember_token_expires_at :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  traits                    :json
#  flag_count                :integer
#  slug                      :string
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
