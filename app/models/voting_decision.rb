class VotingDecision < ApplicationRecord
  belongs_to :voting_form
  belongs_to :candidate

  has_one :vote, through: :voting_form

  validates :vote_must_be_ongoing
  validates :voting_form, presence: true

  private
    def vote_must_be_ongoing
      self.vote.is_ongoing?
    end
end
