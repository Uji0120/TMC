class User::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    
    def after_sign_up_path_for(resource)
        user_path(current_user)
    end
    
    def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :last_name_kana, :first_name_kana, :introduction, :image])
    end


end