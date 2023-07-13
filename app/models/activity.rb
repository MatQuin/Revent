class Activity < ApplicationRecord
  belongs_to :event
  belongs_to :guest

  has_many :propositions, dependent: :destroy
  has_many :guest_activities, dependent: :destroy
  has_many :guests, through: :guest_activities
end
