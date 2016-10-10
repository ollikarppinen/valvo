class VotingStartsController < ApplicationController
  before_action :set_vote, only: [:create]

  # POST /voting_starts
  # POST /voting_starts.json
  def create
    @voting_start = VotingStart.new(vote_id: @vote.id)

    respond_to do |format|
      if @voting_start.save
        format.html { redirect_to controller: :votes, action: :show, id: @vote.id, notice: 'Voting Start was successfully created.' }
        format.json { render :show, status: :created, location: @voting_start }
      else
        format.html { render :new }
        format.json { render json: @voting_start.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_vote
      @vote = Vote.find(params[:vote_id])
    end
end
