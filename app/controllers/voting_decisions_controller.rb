class VotingDecisionsController < ApplicationController
  before_action :set_vote, only: [:index, :create]

  # GET /voting_decisions
  # GET /voting_decisions.json
  def index
    @voting_decisions = VotingDecision.all
  end

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def voting_decision_params
      params.fetch(:voting_decision, {})
    end
end
