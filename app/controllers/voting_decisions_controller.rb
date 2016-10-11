class VotingDecisionsController < ApplicationController
  before_action :set_voting_form, only: [:create]

  # POST /voting_decisions
  # POST /voting_decisions.json
  def create
    @voting_decision = @voting_form.voting_decision.new(voting_decision_params)
    candidate_number = params[:candidate_number]
    unshuffled_candidate_number = @voting_form.shuffle[candidate_number].to_i
    candidate = @voting_form.vote.candidates.to_a[unshuffled_candidate_number]
    @voting_decision.candidate = candidate

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
    def set_voting_form
      @voting_form = VotingForm.find(params[:voting_form_id])
    end

    def voting_decision_params
      params.require(:voting_form).permit(:candidate_number)
    end
end
