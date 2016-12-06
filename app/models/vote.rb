class Vote < ApplicationRecord
  has_many :voting_forms
  has_many :voting_decisions, through: :voting_forms
  has_many :candidates
  has_one :voting_start
  has_one :voting_end

  validates :candidate_count, presence: true
  validates :voting_form_count, presence: true

  validates_numericality_of :candidate_count, on: :create, greater_than: 1, less_than_or_equal_to: 20
  validates_numericality_of :voting_form_count, on: :create, greater_than: 1, less_than_or_equal_to: 50

  after_create :create_voting_forms, :create_candidates

  default_scope { order(created_at: :desc) }

  def started?
    !voting_start.nil?
  end

  def ended?
    !voting_end.nil?
  end

  def ongoing?
    started? && !ended?
  end

  def status
    return 'Ended' if ended?
    return 'Ongoing' if ongoing?
    'Unstarted'
  end

  private

  def create_candidates
    candidate_count.times do |i|
      @candidate = candidates.new
      @candidate.name = "Candidate_#{i + 1}"
      @candidate.save
    end
  end

  def create_voting_forms
    voting_form_count.times do
      @form = voting_forms.new
      @form.shuffle = [*0..candidate_count - 1].shuffle
      @form.save
      @decision = VotingDecision.new
      @decision.voting_form = @form
      @decision.save
    end
  end
end
