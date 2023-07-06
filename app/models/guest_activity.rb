class GuestActivity < ApplicationRecord
  belongs_to :guest
  belongs_to :activity
  validates :guest, uniqueness: { scope: :activity }
end
