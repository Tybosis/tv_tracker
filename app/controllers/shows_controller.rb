class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /shows
  # GET /shows.json
  def index
    @shows = Show.all
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
    @profile = current_user.profiles[0]
  end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = build_show
    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    tvdb = TvdbParty::Search.new("A42FACB54E7022B1")
    results = tvdb.search(params[:Search])
    @shows = results.reject { |show| show["SeriesName"] == "** 403: Series Not Permitted **" }.map { |show| show }
  end

  # return the date if show is showing today else return nothing (false)
  def when_showing
    time = show.air_time
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_show
    @show = Show.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def show_params
    params.require(:show).permit(:name, :air_time, :status, :next_episode, :overview, :banner, :poster)
  end

  def build_show
    tvdb = TvdbParty::Search.new("A42FACB54E7022B1")
    show = tvdb.get_series_by_id(params[:series_id])
    Show.new(name: show.name, air_time: show.air_time, status: show.status,
             next_episode: show.episodes.last.air_date,
             banner: show.series_banners('en').first.url,
             poster: show.posters('en').first.url)
  end
end
