class VotingForm < ApplicationRecord
  belongs_to :vote
  has_one :scanned_vote
  has_one :voting_decision
end
