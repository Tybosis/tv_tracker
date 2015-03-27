class ShowsController < ApplicationController
  before_action :authenticate_user!
  # GET /shows
  # GET /shows.json
  def index
    @profile = current_profile
    if params[:profile_id] # if profile
      @shows = ShowPolicy::Scope.new(current_profile, Show).resolve
      render '/profiles/profile_shows_index' # goto Profile/shows (calendar)
    else
      @shows = Show.all # go to all shows
    end
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
    @show = Show.find(params[:id])
    @profile = Profile.find(session[:profile_id])
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

  def search
    results = TVDB.search(params[:Search])
    @shows = results.reject { |show| show["SeriesName"] == "** 403: Series Not Permitted **" }.map { |show| show }
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def show_params
    params.require(:show).permit(:name, :air_time, :status, :next_episode, :overview, :banner, :poster)
  end

  def build_show
    show = TVDB.get_series_by_id(params[:series_id])
    Show.new(name: show.name, air_time: show.air_time, status: show.status,
             episodes: show.episodes.last(20),
             banner: get_banner(show),
             poster: get_poster(show),
             overview: show.overview)
  end

  def get_banner(show)
    return "" if show.series_banners('en').first.nil?
    show.series_banners('en').first.url
  end

  def get_poster(show)
    return "" if show.posters('en').first.nil?
    show.posters('en').first.url
  end
end
