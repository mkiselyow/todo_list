class SessionsController < ApplicationController
  before_action :authorized, only: [:create, :fb_create]

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      sign_in user
      redirect_to root_url, notice: "Logged In!"
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    sign_out
    redirect_to root_url, notice: "Logged Out!"
  end

  def fb_create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    sign_in user
    redirect_to root_url
  end

  def fb_destroy
    session[:user_id] = nil
    sign_out
    redirect_to root_url
  end
end
