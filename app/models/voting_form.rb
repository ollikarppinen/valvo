class VotingForm < ApplicationRecord
  belongs_to :vote
  has_one :voting_decision

  validates :vote, presence: true
end
