class VotingInitiationsController < ApplicationController
  before_action :set_voting_initiation, only: [:show, :edit, :update, :destroy]
  before_action :set_vote, only: [:index, :create]

  # GET /voting_initiations
  # GET /voting_initiations.json
  def index
    @vote = Vote.find(params[:vote_id])
  end

  # GET /voting_initiations/1
  # GET /voting_initiations/1.json
  def show
  end

  # GET /voting_initiations/new
  def new
    @voting_initiation = VotingInitiation.new
  end

  # GET /voting_initiations/1/edit
  def edit
  end

  # POST /voting_initiations
  # POST /voting_initiations.json
  def create
    @voting_initiation = VotingInitiation.new(vote_id: @vote.id)

    respond_to do |format|
      if @voting_initiation.save
        format.html { redirect_to action: :index, notice: 'Voting initiation was successfully created.' }
        format.json { render :show, status: :created, location: @voting_initiation }
      else
        format.html { render :new }
        format.json { render json: @voting_initiation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voting_initiations/1
  # DELETE /voting_initiations/1.json
  def destroy
    @voting_initiation.destroy
    respond_to do |format|
      format.html { redirect_to voting_initiations_url, notice: 'Voting initiation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voting_initiation
      @voting_initiation = VotingInitiation.find(params[:id])
    end

    def set_vote
      @vote = Vote.find(params[:vote_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voting_initiation_params
      params.fetch(:voting_initiation, {})
    end
end
