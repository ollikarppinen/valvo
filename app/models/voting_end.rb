class VotingEnd < ApplicationRecord
  belongs_to :vote

  validates :vote, presence: true
end
