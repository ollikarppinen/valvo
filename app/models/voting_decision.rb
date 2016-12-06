class VotingDecision < ApplicationRecord
  belongs_to :voting_form
  belongs_to :candidate, optional: true

  has_one :vote, through: :voting_form

  validates :voting_form, presence: true

  # TODO: Set less_than_to to candidate count
  validates_numericality_of(
    :candidate_number,
    on: :update, greater_than_or_equal_to: -1,
    less_than_to: 50
  )
end
