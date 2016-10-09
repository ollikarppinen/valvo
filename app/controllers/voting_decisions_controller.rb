class VotingDecisionsController < ApplicationController
  before_action :set_voting_decision, only: [:show, :edit, :update, :destroy]

  # GET /voting_decisions
  # GET /voting_decisions.json
  def index
    @voting_decisions = VotingDecision.all
  end

  # GET /voting_decisions/1
  # GET /voting_decisions/1.json
  def show
  end

  # GET /voting_decisions/new
  def new
    @voting_decision = VotingDecision.new
  end

  # GET /voting_decisions/1/edit
  def edit
  end

  # POST /voting_decisions
  # POST /voting_decisions.json
  def create
    @voting_decision = VotingDecision.new(voting_decision_params)

    respond_to do |format|
      if @voting_decision.save
        format.html { redirect_to @voting_decision, notice: 'Voting decision was successfully created.' }
        format.json { render :show, status: :created, location: @voting_decision }
      else
        format.html { render :new }
        format.json { render json: @voting_decision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voting_decisions/1
  # PATCH/PUT /voting_decisions/1.json
  def update
    respond_to do |format|
      if @voting_decision.update(voting_decision_params)
        format.html { redirect_to @voting_decision, notice: 'Voting decision was successfully updated.' }
        format.json { render :show, status: :ok, location: @voting_decision }
      else
        format.html { render :edit }
        format.json { render json: @voting_decision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voting_decisions/1
  # DELETE /voting_decisions/1.json
  def destroy
    @voting_decision.destroy
    respond_to do |format|
      format.html { redirect_to voting_decisions_url, notice: 'Voting decision was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voting_decision
      @voting_decision = VotingDecision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voting_decision_params
      params.fetch(:voting_decision, {})
    end
end
