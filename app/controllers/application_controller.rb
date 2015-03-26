class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  before_action :current_profile
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resource)
    profiles_path
  end

  def current_profile
    if current_user
      if !session[:profile_id]
        redirect_to profiles_path && return
      else
        @current_profile ||= Profile.find(session[:profile_id])
      end
    end
  end
end
