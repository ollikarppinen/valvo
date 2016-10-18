class Candidate < ApplicationRecord
  belongs_to :vote
  has_many :voting_decisions

  validates :vote, presence: true

  default_scope  { order(:name => :asc) }

  def votes
    self.vote.voting_decisions.select { |x| x.candidate == self }.size
  end
end
