class Admin::SessionsController < Devise::SessionsController
 
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

end