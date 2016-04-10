class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # Check this https://teamtreehouse.com/community/no-attr-accessible-in-userrb-didnt-get-the-message-for-firstname-lastname-profilename-either
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :profile_name, :email, :password, :remeber_me) }
  end
end
