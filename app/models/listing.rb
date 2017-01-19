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
#  lat            :decimal(10, 6)
#  lng            :decimal(10, 6)
#  slug           :string
#  flag_count     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Listing < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  has_many :listing_assignments, dependent: :destroy
  has_many :users, through: :listing_assignments
  has_many :flags, as: :flaggable

  validates :name, :description, presence: true

  validates :country, :city, presence: {
      if: Proc.new {|listing| !listing.hotel.blank? }
    }



  belongs_to :event
  after_create :increment_event_counter_cache
  after_update :update_event_counter_cache
  after_destroy :decrement_event_counter_cache

  TYPES = [
    "looking for room",
    "have room"
  ]

  def slug_candidates
    [
      :name
    ]
  end

  PRICE = ['free', '$0-$50', '$50-$100', '$100-$200', '$200+']

  def short_listing_type_name
    if listing_type == TYPES[0]
      return 'lfr'
    elsif listing_type == TYPES[1]
      return 'hr'
    end
  end

  private

  def increment_event_counter_cache
    cache_column = short_listing_type_name + "_count"
    self.event.increment!(cache_column)
    self.event.increment!(:listing_count)
  end

  def update_event_counter_cache
    if listing_type_changed?
      cache_column = short_listing_type_name + "_count"
      self.event.increment!(cache_column)
      decrement_column =  listing_type_was == 'looking for room' ? 'lfr_count' : 'hr_count'
      self.event.decrement!(decrement_column)
    end
  end

  def decrement_event_counter_cache
    cache_column = short_listing_type_name + "_count"
    self.event.decrement!(cache_column)
    self.event.decrement!(:listing_count)
  end

end
