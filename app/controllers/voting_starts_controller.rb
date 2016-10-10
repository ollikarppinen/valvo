class VotingStartsController < ApplicationController
  before_action :set_voting_start, only: [:show, :edit, :update, :destroy]
  before_action :set_vote, only: [:index, :create]

  # GET /voting_starts
  # GET /voting_starts.json
  def index
    @vote = Vote.find(params[:vote_id])
  end

  # GET /voting_starts/1
  # GET /voting_starts/1.json
  def show
  end

  # GET /voting_starts/new
  def new
    @voting_start = VotingStart.new
  end

  # GET /voting_starts/1/edit
  def edit
  end

  # POST /voting_starts
  # POST /voting_starts.json
  def create
    @voting_start = VotingStart.new(vote_id: @vote.id)

    respond_to do |format|
      if @voting_start.save
        format.html { redirect_to action: :index, notice: 'Voting Start was successfully created.' }
        format.json { render :show, status: :created, location: @voting_start }
      else
        format.html { render :new }
        format.json { render json: @voting_start.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voting_starts/1
  # DELETE /voting_starts/1.json
  def destroy
    @voting_start.destroy
    respond_to do |format|
      format.html { redirect_to voting_starts_url, notice: 'Voting Start was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voting_start
      @voting_start = VotingStart.find(params[:id])
    end

    def set_vote
      @vote = Vote.find(params[:vote_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voting_start_params
      params.fetch(:voting_start, {})
    end
end
