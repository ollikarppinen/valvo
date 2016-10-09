class Vote < ApplicationRecord
  has_many :voting_forms
  has_many :scanned_votes, through: :voting_forms
  has_many :candidates
  has_one :voting_initiation
  has_one :voting_conclusion

  validates :candidate_count, presence: true
  validates :voting_form_count, presence: true

  validates_numericality_of :candidate_count, on: :create, greater_than: 1
  validates_numericality_of :voting_form_count, on: :create, greater_than: 1

  after_create :create_voting_forms_and_candidates

  private
    def create_voting_forms_and_candidates
      self.candidate_count.times do
        self.candidates.create
      end
      self.voting_form_count.times do
        self.voting_forms.create
      end
    end
end
