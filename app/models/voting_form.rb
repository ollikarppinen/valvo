class VotingForm < ApplicationRecord
  belongs_to :vote
  has_one :voting_decision

  validates :vote, presence: true

  def voted?
    !voting_decision.candidate_number.empty?
  end
end
