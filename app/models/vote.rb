class Vote < ApplicationRecord
  belongs_to :guest
  belongs_to :proposition
end
