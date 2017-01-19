# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  name           :string
#  website        :string
#  venue_name     :string
#  country        :string
#  state          :string
#  city           :string
#  street_address :string
#  postal_code    :string
#  start_date     :date
#  end_date       :date
#  lat            :decimal(10, 6)
#  lng            :decimal(10, 6)
#  slug           :string
#  listing_count  :integer          default(0)
#  lfr_count      :integer          default(0)
#  hr_count       :integer          default(0)
#  flag_count     :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :user
  has_many :listings
  has_many :looking_for_listings, -> {where('listings.listing_type = ?', Listing::TYPES[0])}, class_name: 'Listing'
  has_many :have_listings, -> {where('listings.listing_type = ?', Listing::TYPES[1])}, class_name: 'Listing'

  has_many :listings

  has_many :flags, as: 'flaggable'

  scope :current, -> {where('events.end_date' < Date.today.to_s(:db))}

  validates :name, :country, :city, :street_address, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validate :date_validations

  def slug_candidates
    [
      :name,
     [:name, self.start_date.try(:year)]
    ]
  end

  private

  def date_validations
    return nil unless start_date && end_date
    if start_date > end_date
      errors.add(:end_date, "must come before the start date")
    end
  end

end
