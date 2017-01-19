# == Schema Information
#
# Table name: admins
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
#

class Admin < ApplicationRecord

  include SessionMethodIncludes

  has_secure_password

  validates :username, :email, :first_name, :last_name, presence: true
  validates_length_of :password, minimum: 8, confirmation: true, on: :create
  validates_length_of :password, minimum: 8, confirmation: true, on: :update, unless: 'password.nil?'
  validates_length_of :username, minimum: 5
  validates_length_of :first_name, minimum: 3
  validates_length_of :last_name, minimum: 3

  validates :email,
    format: { with: STANDARD_EMAIL_REGEX, message: 'is an invalid address' }
  validates_uniqueness_of :username, case_sensitive: false
  validates :email, confirmation: { if: :email_changed? }

  scope :sorted, lambda { order(:last_name, :first_name) }

  def full_name
    "#{first_name} #{last_name}"
  end

  # Keep this method public and as a class method because it is called by
  # methods contained in session_method_includes.rb
  def self.create_token
    Digest::SHA1.hexdigest("Create a random string using #{Time.current}")
  end

  def self.authenticate(username, password)
    user = where(username: username).first
    return false if user.nil?
    user.authenticate(password)
  end

end
