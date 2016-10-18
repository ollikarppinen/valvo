class VotingDecision < ApplicationRecord
  belongs_to :voting_form
  belongs_to :candidate, optional: true

  has_one :vote, through: :voting_form

  validates :voting_form, presence: true
end
