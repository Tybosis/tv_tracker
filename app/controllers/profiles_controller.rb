class ProfilesController < ApplicationController
  skip_before_action :current_profile
  before_action :authenticate_user!
  before_action :set_current_profile, only: [:index, :show, :edit]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def profile_shows
    @profile = Profile.find(params[:profile_id])
  end

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = policy_scope(Profile)
    @uploader = Profile.new.image
    @uploader.success_action_redirect = new_profile_url
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])
  end

  # GET /profiles/new
  def new
    @profile = Profile.new(:key => params[:key])
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        good_change(format, :created)
      else
        bad_change(format, :new)
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        good_change(format, :ok)
      else
        bad_change(format, :edit)
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    session[:profile_id] = nil
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select_profile
    session[:profile_id] = params[:profile_id]
    redirect_to profile_shows_path session[:profile_id]
  end

  def remove_show_from_profile
    @profile = Profile.find(params[:profile_id])
    show = Show.find(params[:format])
    @profile.shows.delete show
    redirect_to @profile
  end

  def set_current_profile
    @current_profile ||= Profile.find(session[:profile_id])
  rescue ActiveRecord::RecordNotFound
    @current_profile = nil
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params[:profile][:show_ids] = params[:profile][:show_ids].split if params[:profile][:show_ids]
    params.require(:profile).permit(:name, :image, :remote_image_url, :key, show_ids: [])
  end

  def good_change(format, status)
    session[:profile_id] = @profile.id
    format.html { redirect_to @profile, notice: 'Profile was successfully changed.' }
    format.json { render :show, status: status, location: @profile }
  end

  def bad_change(format, status)
    format.html { render status }
    format.json { render json: @profile.errors, status: :unprocessable_entity }
  end
end
