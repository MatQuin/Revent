class Upvote < ApplicationRecord
  belongs_to :guest
  belongs_to :proposition
  validates_uniqueness_of :guest, scope: :proposition
end
