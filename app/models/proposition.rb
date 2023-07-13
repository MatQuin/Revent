class Proposition < ApplicationRecord
  belongs_to :activity
  belongs_to :guest
  has_many :upvotes, dependent: :destroy
end
