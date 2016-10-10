class VotingEndsController < ApplicationController
  before_action :set_voting_end, only: [:show, :edit, :update, :destroy]
  before_action :set_vote, only: [:index, :create]

  # GET /voting_ends
  # GET /voting_ends.json
  def index
    @vote = Vote.find(params[:vote_id])
  end

  # GET /voting_ends/1
  # GET /voting_ends/1.json
  def show
  end

  # GET /voting_ends/new
  def new
    @voting_end = VotingEnd.new
  end

  # GET /voting_ends/1/edit
  def edit
  end

  # POST /voting_ends
  # POST /voting_ends.json
  def create
    @voting_end = VotingEnd.new(vote_id: @vote.id)

    respond_to do |format|
      if @voting_end.save
        format.html { redirect_to action: :index, notice: 'Voting End was successfully created.' }
        format.json { render :show, status: :created, location: @voting_end }
      else
        format.html { render :new }
        format.json { render json: @voting_end.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voting_ends/1
  # PATCH/PUT /voting_ends/1.json
  def update
    respond_to do |format|
      if @voting_end.update(voting_end_params)
        format.html { redirect_to @voting_end, notice: 'Voting End was successfully updated.' }
        format.json { render :show, status: :ok, location: @voting_end }
      else
        format.html { render :edit }
        format.json { render json: @voting_end.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voting_ends/1
  # DELETE /voting_ends/1.json
  def destroy
    @voting_end.destroy
    respond_to do |format|
      format.html { redirect_to voting_ends_url, notice: 'Voting End was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voting_end
      @voting_end = VotingEnd.find(params[:id])
    end

    def set_vote
      @vote = Vote.find(params[:vote_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voting_end_params
      params.fetch(:voting_end, {})
    end
end
