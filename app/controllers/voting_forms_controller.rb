class VotingFormsController < ApplicationController
  before_action :set_voting_form, only: [:show, :update]

  # GET /voting_forms/1
  def show
  end

  # POST /voting_forms
  # TODO: Fuggly
  def update
    @voting_decision = @voting_form.voting_decision ? @voting_form.voting_decision : VotingDecision.new
    @voting_decision.voting_form = @voting_form
    @voting_decision.candidate_number = params[:candidate_number].nil? ? nil : params[:candidate_number].to_i
    if @voting_decision.candidate_number && @voting_decision.candidate_number > 0 && @voting_decision.candidate_number <= @voting_form.vote.candidates.size
      candidate_index = @voting_form.shuffle[@voting_decision.candidate_number - 1]
      @voting_decision.candidate = @voting_form.vote.candidates.to_a[candidate_index]
    else
      @voting_decision.candidate = nil
    end

    respond_to do |format|
      if @voting_decision.save
        format.html { redirect_to @voting_form, notice: 'Your vote has been counted.' }
        format.json { render :show, status: :created, location: @voting_form }
      else
        format.html { redirect_to @voting_form, notice: 'Errors' }
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
