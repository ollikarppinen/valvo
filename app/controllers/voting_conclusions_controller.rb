class VotingConclusionsController < ApplicationController
  before_action :set_voting_conclusion, only: [:show, :edit, :update, :destroy]
  before_action :set_vote, only: [:index, :create]

  # GET /voting_conclusions
  # GET /voting_conclusions.json
  def index
    @vote = Vote.find(params[:vote_id])
  end

  # GET /voting_conclusions/1
  # GET /voting_conclusions/1.json
  def show
  end

  # GET /voting_conclusions/new
  def new
    @voting_conclusion = VotingConclusion.new
  end

  # GET /voting_conclusions/1/edit
  def edit
  end

  # POST /voting_conclusions
  # POST /voting_conclusions.json
  def create
    @voting_conclusion = VotingConclusion.new(vote_id: @vote.id)

    respond_to do |format|
      if @voting_conclusion.save
        format.html { redirect_to action: :index, notice: 'Voting conclusion was successfully created.' }
        format.json { render :show, status: :created, location: @voting_conclusion }
      else
        format.html { render :new }
        format.json { render json: @voting_conclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voting_conclusions/1
  # PATCH/PUT /voting_conclusions/1.json
  def update
    respond_to do |format|
      if @voting_conclusion.update(voting_conclusion_params)
        format.html { redirect_to @voting_conclusion, notice: 'Voting conclusion was successfully updated.' }
        format.json { render :show, status: :ok, location: @voting_conclusion }
      else
        format.html { render :edit }
        format.json { render json: @voting_conclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voting_conclusions/1
  # DELETE /voting_conclusions/1.json
  def destroy
    @voting_conclusion.destroy
    respond_to do |format|
      format.html { redirect_to voting_conclusions_url, notice: 'Voting conclusion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voting_conclusion
      @voting_conclusion = VotingConclusion.find(params[:id])
    end

    def set_vote
      @vote = Vote.find(params[:vote_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voting_conclusion_params
      params.fetch(:voting_conclusion, {})
    end
end
