class Candidate < ApplicationRecord
  belongs_to :vote
  has_many :voting_decisions

  validates :vote, presence: true

  default_scope  { order(:name => :asc) }
end
