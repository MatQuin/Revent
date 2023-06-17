class GuestActivity < ApplicationRecord
  belongs_to :guest
  belongs_to :activity
end
