class VotingFormsController < ApplicationController
  before_action :set_voting_form, only: [:show]

  # GET /voting_forms/1
  # GET /voting_forms/1.json
  def show
  end

  private
    def set_voting_form
      @voting_form = VotingForm.find(params[:id])
    end
end
