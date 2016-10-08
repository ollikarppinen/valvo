class Vote < ApplicationRecord
  has_many :single_votes
  has_many :scanned_votes, through: :single_votes
  has_many :candidates
end
