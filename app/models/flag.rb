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

class Flag < ApplicationRecord

  belongs_to :flaggable, polymorphic: true
  belongs_to :user
  belongs_to :admin

  scope :unchecked, -> {where('flags.status is NULL')}

  STATUS = [
    'violation',
    'not-violation'
  ]

  TYPE = [
    'harrasment',
    'slurs',
    'obscene',
    'violation of tos'
  ]

  after_create :increment_counter_cache
  after_update
  after_destroy :decrement_counter_cache

   private

  def increment_counter_cache
    self.flaggable.increment!(:flag_count)
  end

  def decrement_counter_cache
    self.flaggable.decrement!(:flag_count)
  end

end
