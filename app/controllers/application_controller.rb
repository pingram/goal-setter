class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  helper_method :current_user, :signed_in?, :get_auth_token

  def get_auth_token
    "<input type='hidden'
      name='authenticity_token'
      value='#{form_authenticity_token}'>".html_safe
  end
end
