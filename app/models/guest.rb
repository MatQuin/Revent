class Guest < ApplicationRecord
  belongs_to :event
  belongs_to :user

  has_many :propositions, dependent: :destroy
  has_many :guest_activities, dependent: :destroy
  has_many :activities, through: :guest_activities
  has_many :upvotes, dependent: :destroy
end
