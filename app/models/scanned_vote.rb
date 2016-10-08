class ScannedVote < ApplicationRecord
  belongs_to :single_vote
  belongs_to :candidate
end
