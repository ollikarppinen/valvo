class ScannedVote < ApplicationRecord
  belongs_to :voting_form
  belongs_to :candidate
end
