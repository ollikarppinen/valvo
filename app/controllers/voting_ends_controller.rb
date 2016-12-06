class VotingEndsController < ApplicationController
  before_action :set_vote, only: [:create]

  # POST /voting_ends
  # POST /voting_ends.json
  def create
    @voting_end = VotingEnd.new(vote_id: @vote.id)

    respond_to do |format|
      if @voting_end.save
        format.html { redirect_to controller: :votes, action: :show, id: @vote.id, notice: 'Voting End was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    def set_vote
      @vote = Vote.find(params[:vote_id])
    end
end
