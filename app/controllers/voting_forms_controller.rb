class VotingFormsController < ApplicationController
  before_action :set_voting_form, only: [:show, :edit, :update, :destroy]
  before_action :set_vote, only: [:index]

  # GET /voting_forms
  # GET /voting_forms.json
  def index
    @voting_forms = @vote.voting_forms
  end

  # GET /voting_forms/1
  # GET /voting_forms/1.json
  def show
  end

  # GET /voting_forms/new
  def new
    @voting_form = VotingForm.new
  end

  # GET /voting_forms/1/edit
  def edit
  end

  # POST /voting_forms
  # POST /voting_forms.json
  def create
    @voting_form = VotingForm.new(voting_form_params)

    respond_to do |format|
      if @voting_form.save
        format.html { redirect_to @voting_form, notice: 'Voting Form was successfully created.' }
        format.json { render :show, status: :created, location: @voting_form }
      else
        format.html { render :new }
        format.json { render json: @voting_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voting_forms/1
  # PATCH/PUT /voting_forms/1.json
  def update
    respond_to do |format|
      if @voting_form.update(voting_form_params)
        format.html { redirect_to @voting_form, notice: 'Voting Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @voting_form }
      else
        format.html { render :edit }
        format.json { render json: @voting_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voting_forms/1
  # DELETE /voting_forms/1.json
  def destroy
    @voting_form.destroy
    respond_to do |format|
      format.html { redirect_to voting_forms_url, notice: 'Voting Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_vote
      @vote = Vote.find(params[:vote_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_voting_form
      @voting_form = VotingForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voting_form_params
      params.fetch(:voting_form, {})
    end
end
