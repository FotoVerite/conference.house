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

class User < ApplicationRecord
  acts_as_messageable
  include SessionMethodIncludes
  has_secure_password

  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]

  has_many :events

  has_many :listing_assignments, dependent: :destroy
  has_many :listings, through: :listing_assignments

  has_many :flags
  has_many :flagged_listings, through: :flags, source: :flaggable, source_type: 'Listing'

  validates :username, :email, :first_name, :last_name, presence: true
  validates_length_of :password, minimum: 8, confirmation: true, on: :create
  validates_length_of :password, minimum: 8, confirmation: true, on: :update, unless: 'password.nil?'
  validates_length_of :username, minimum: 5
  validates_length_of :first_name, minimum: 1
  validates_length_of :last_name, minimum: 1

  validates :email,
    format: { with: STANDARD_EMAIL_REGEX, message: 'is an invalid address' }
  validates_uniqueness_of :username, case_sensitive: false
  validates :email, confirmation: { if: :email_changed? }

  scope :sorted, lambda { order(:last_name, :first_name) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def name
    full_name
  end

  def mailboxer_email(object)
   "#{username}@house.xyz"
  end

  # Keep this method public and as a class method because it is called by
  # methods contained in session_method_includes.rb
  def self.create_token
    Digest::SHA1.hexdigest("Create a random string using #{Time.current}")
  end

  def self.authenticate(username, password)
    user = where(username: username).first || where(email: username).first
    return false if user.nil?
    user.authenticate(password)
  end

end
