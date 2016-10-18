class Vote < ApplicationRecord
  has_many :voting_forms
  has_many :voting_decisions, through: :voting_forms
  has_many :candidates
  has_one :voting_start
  has_one :voting_end

  validates :candidate_count, presence: true
  validates :voting_form_count, presence: true

  validates_numericality_of :candidate_count, on: :create, greater_than: 1, less_than_or_equal_to: 20
  validates_numericality_of :voting_form_count, on: :create, greater_than: 1, less_than_or_equal_to: 20

  after_create :create_voting_forms_and_candidates

  default_scope  { order(:created_at => :desc) }

  def has_started?
    not self.voting_start.nil?
  end

  def has_ended?
    not self.voting_end.nil?
  end

  def is_ongoing?
    has_started? && !has_ended?
  end

  def status
    return "Ended" if self.has_ended?
    return "Ongoing" if self.is_ongoing?
    "Unstarted"
  end

  private
    def create_voting_forms_and_candidates
      self.candidate_count.times do |i|
        @candidate = self.candidates.new
        @candidate.name = "Candidate_#{i + 1}"
        @candidate.save
      end
      self.voting_form_count.times do
        @form = self.voting_forms.new
        @form.shuffle = [*0..self.candidate_count - 1].shuffle
        @form.save
      end
    end
end
