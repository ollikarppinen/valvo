class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update]

  # caches_action :show, format: :pdf

  # GET /votes
  def index
    @votes = Vote.all.select { |v| !v.private }
  end

  # GET /votes/1
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render_pdf
      end
    end
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # POST /votes
  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to @vote, notice: 'Voting was successfully created.'
    else
      render :new
    end
  end

  def update
    @uuid = params[:uuid]
    if @uuid == @vote.start_uuid && !@vote.started?
      @vote.voting_start = VotingStart.create(vote_id: @vote.id)
      @notice = 'Voting was successfully started.'
    elsif @uuid == @vote.end_uuid && !@vote.ended?
      @vote.voting_end = VotingEnd.create(vote_id: @vote.id)
      @notice = 'Voting was successfully ended.'
    end
    respond_to do |format|
      format.html { redirect_to @vote, notice: @notice }
    end
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:candidate_count, :voting_form_count, :title, :private)
  end

  def render_pdf
    render pdf: 'file_name', template: 'votes/show.pdf.erb'
  end
end
