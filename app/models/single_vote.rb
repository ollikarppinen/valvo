class SingleVote < ApplicationRecord
  belongs_to :vote
  has_one :scanned_vote
end
