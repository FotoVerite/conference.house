require 'ffaker'

FactoryGirl.define do
  factory :flag do

  end
  sequence :email do |n|
    "basic_email#{n}@gmail.com"
  end

  sequence :slug do |n|
    "slug-#{n}"
  end

  sequence :username do |n|
    "#{ FFaker::Company.bs}-username#{n}"
  end
end