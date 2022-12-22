class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    before_action :authenticate_user!, except: [:new, :create]
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        default_parameters = %i[name role]
        devise_parameter_sanitizer.permit(:sign_up, keys: default_parameters)
        devise_parameter_sanitizer.permit(:sign_in, keys: default_parameters)
        devise_parameter_sanitizer.permit(:account_update, keys: default_parameters)
    end

    private
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to splashs_index_path, notice: "Please Login to view that page!" if request.original_fullpath != splashs_index_path
    end
  end
end
