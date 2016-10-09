class VotingDecision < ApplicationRecord
  belongs_to :voting_form
  belongs_to :candidate

  has_one :vote, through: :voting_form

  validates :voting_form, presence: true
  validates :candidate, presence: true
end
