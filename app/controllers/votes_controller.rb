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
      if params['candidate-label-radio'] == 'candidate-labeled'
        @vote.create_labeled_candidates(params['candidate-labels'])
      elsif params['candidate-label-radio'] == 'candidate-unlabeled'
        @vote.create_unlabeled_candidates(params['candidate-count'])
      end
      @vote.create_voting_forms
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

    redirect_to @vote, notice: @notice
  end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:voting_form_count, :title, :private)
  end

  def render_pdf
    render pdf: 'file_name', template: 'votes/show.pdf.erb'
  end
end
