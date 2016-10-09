class Candidate < ApplicationRecord
  belongs_to :vote
  has_many :voting_decisions
end
