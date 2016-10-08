class Candidate < ApplicationRecord
  belongs_to :vote
  has_many :scanned_votes
end
