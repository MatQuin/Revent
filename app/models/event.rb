class Event < ApplicationRecord
  belongs_to :user

  has_many :guests, dependent: :destroy
  has_many :activities, dependent: :destroy

  has_one_attached :photo

  validates :title, presence: true

  after_validation :geocode, if: :will_save_change_to_address?

  geocoded_by :address
end
