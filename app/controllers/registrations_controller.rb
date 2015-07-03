class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    session[:profile_id] = Profile.where(user_id: current_user.id).first.id
    "/shows"
  end
end
