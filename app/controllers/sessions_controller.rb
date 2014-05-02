class SessionsController < ApplicationController
  before_action :ensure_signed_in, only: :destroy

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      user_params[:username],
      user_params[:password])
    if @user.nil?
      flash.now[:errors] = ['credentials were incorrect']
      render :new
    else
      sign_in!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    sign_out!
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
