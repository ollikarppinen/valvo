class VotingFormsController < ApplicationController
  before_action :set_voting_form, only: [:show, :update]

  # GET /voting_forms/1
  def show
  end

  # POST /voting_forms
  def update
    @voting_decision = VotingDecision.new
    @voting_decision.voting_form = @voting_form
    @voting_decision.candidate_number = params[:candidate_number]
    unshuffled_candidate_number = @voting_form.shuffle[@voting_decision.candidate_number].to_i
    candidate = @voting_form.vote.candidates.to_a[unshuffled_candidate_number]
    @voting_decision.candidate = candidate

    respond_to do |format|
      if @voting_decision.save
        format.html { redirect_to @voting_form, notice: 'Vote was successfully counted.' }
        format.json { render :show, status: :created, location: @voting_form }
      else
        format.html { render :new }
        format.json { render json: @voting_form.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_voting_form
      @voting_form = VotingForm.find(params[:id])
    end

    def voting_decision_params
      params.permit(:candidate_number)
    end
end
