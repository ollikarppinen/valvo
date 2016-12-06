class VotingDecisionsController < ApplicationController
  before_action :set_voting_decision, only: [:show, :update]

  # GET /voting_decisions
  def show() end

  # PATCH /voting_decisions
  def update
    @voting_decision.update!(voting_decision_params)
    if @voting_decision.save
      VotesHelper.update_candidate(@voting_decision)
      redirect_to @voting_decision, notice: 'You have voted!'
    else
      redirect_to @voting_decision, notice: 'Errors'
    end
  end

  private

  def set_voting_decision
    @voting_decision = VotingDecision.find(params[:id])
  end

  def voting_decision_params
    params.require(:voting_decision).permit(:candidate_number)
  end
end
