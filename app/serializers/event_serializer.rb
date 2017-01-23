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

class EventSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include ActionView::Helpers
  include EventsHelper

  attributes :address, :date_span_attribute, :end_date, :name, :start_date, :website, :listing_url, :hr_count, :lfr_count

  def listing_url
    link_to "Rooms", event_listings_path(object)
  end

  def date_span_attribute
    date_span(object.start_date, object.end_date)
  end

  def address
    address_string(object).html_safe
  end

end
