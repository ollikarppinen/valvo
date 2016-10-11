class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
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
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @uuid = params[:uuid]
    if @uuid == @vote.start_uuid && !@vote.has_started?
      VotingStart.create(vote_id: @vote.id)
    elsif @uuid == @vote.end_uuid && !@vote.has_ended?
      VotingEnd.create(vote_id: @vote.id)
    end
  end

  private
    def set_vote
      @vote = Vote.find(params[:id])
    end


    def vote_params
      params.require(:vote).permit(:candidate_count, :voting_form_count)
    end

    def render_pdf
      render :pdf => "file_name", :template => 'votes/show.pdf.erb'
    end
end
