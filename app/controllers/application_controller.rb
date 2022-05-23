class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        categories_path
    end

    def after_sign_out_path_for(resource)
        splash_screen_index_path
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |u|
            u.permit(:name, :email, :password, :password_confirmation)
        end

        devise_parameter_sanitizer.permit(:account_update) do |u|
            u.permit(:name, :email, :password, :password_confirmation, :current_password)
        end

        devise_parameter_sanitizer.permit(:sign_in) do |u|
            u.permit(:email, :password)
          end
    end
end
