class SingleVotesController < ApplicationController
  before_action :set_single_vote, only: [:show, :edit, :update, :destroy]

  # GET /single_votes
  # GET /single_votes.json
  def index
    @single_votes = SingleVote.all
  end

  # GET /single_votes/1
  # GET /single_votes/1.json
  def show
  end

  # GET /single_votes/new
  def new
    @single_vote = SingleVote.new
  end

  # GET /single_votes/1/edit
  def edit
  end

  # POST /single_votes
  # POST /single_votes.json
  def create
    @single_vote = SingleVote.new(single_vote_params)

    respond_to do |format|
      if @single_vote.save
        format.html { redirect_to @single_vote, notice: 'Single vote was successfully created.' }
        format.json { render :show, status: :created, location: @single_vote }
      else
        format.html { render :new }
        format.json { render json: @single_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /single_votes/1
  # PATCH/PUT /single_votes/1.json
  def update
    respond_to do |format|
      if @single_vote.update(single_vote_params)
        format.html { redirect_to @single_vote, notice: 'Single vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @single_vote }
      else
        format.html { render :edit }
        format.json { render json: @single_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /single_votes/1
  # DELETE /single_votes/1.json
  def destroy
    @single_vote.destroy
    respond_to do |format|
      format.html { redirect_to single_votes_url, notice: 'Single vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_single_vote
      @single_vote = SingleVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def single_vote_params
      params.fetch(:single_vote, {})
    end
end
