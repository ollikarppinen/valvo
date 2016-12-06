class Vote < ApplicationRecord
  has_many :voting_forms
  has_many :voting_decisions, through: :voting_forms
  has_many :candidates
  has_one :voting_start
  has_one :voting_end

  validates :voting_form_count, presence: true

  validates_numericality_of :voting_form_count, on: :create, greater_than: 1, less_than_or_equal_to: 50

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

  def candidate_count
    candidates.count
  end

  def create_unlabeled_candidates(count)
    count.times do |i|
      create_candidate("Candidate_#{i + 1}")
    end
  end

  def create_labeled_candidates(labels)
    labels.each do |l|
      create_candidate(l)
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

  private

  def create_candidate(label)
    @candidate = candidates.new
    @candidate.name = label
    @candidate.save
  end
end
