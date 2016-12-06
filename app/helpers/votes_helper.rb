module VotesHelper
  def self.update_candidate(voting_decision)
    shuffled_candidate_number = voting_decision.candidate_number
    candidate_number_valid = (
      shuffled_candidate_number > 0 &&
      shuffled_candidate_number <= voting_decision.vote.candidate_count
    )
    voting_decision.candidate = candidate_number_valid ? get_candidate(voting_decision) : nil
    voting_decision.save
  end

  def self.unshuffle_candidate_number(voting_decision)
    voting_decision.voting_form.shuffle[voting_decision.candidate_number - 1].to_i
  end

  def self.get_candidate(voting_decision)
    voting_decision.vote.candidates.to_a[unshuffle_candidate_number(voting_decision)]
  end
end
