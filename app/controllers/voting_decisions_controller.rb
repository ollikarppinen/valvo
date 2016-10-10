class VotingDecisionsController < ApplicationController
  before_action :set_vote, only: [:create]

  # POST /voting_decisions
  # POST /voting_decisions.json
  def create
    @voting_decision = VotingDecision.new(voting_decision_params)

    respond_to do |format|
      if @voting_decision.save
        format.html { redirect_to @voting_decision, notice: 'Voting decision was successfully created.' }
        format.json { render :show, status: :created, location: @voting_decision }
      else
        format.html { render :new }
        format.json { render json: @voting_decision.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:vote_id])
    end
end
