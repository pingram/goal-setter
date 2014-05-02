module SessionsHelper
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def sign_out!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def ensure_signed_in
    redirect_to new_session_url unless signed_in?
  end
end
