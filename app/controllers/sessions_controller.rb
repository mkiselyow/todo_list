class SessionsController < ApplicationController
  before_action :authorized, except: [:create, :fb_create, :new]

  def create
    if params[:session] && params[:session][:email]
      user = User.find_by_email(params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        sign_in user
        redirect_to root_url, notice: "Logged In!"
      else
        # flash.now[:error] = 'Invalid email/password combination' # Not quite right!
        render 'new', notice: "Invalid email/password combination"
      end
    else
      render 'new', notice: "Invalid email/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    sign_out
    # redirect_to root_url, notice: "Logged Out!"
    respond_to do |format|
      format.js { redirect_to root_url, notice: 'Session was successfully deleted.' }
      format.html { redirect_to root_url, notice: 'Session was successfully deleted.' }
      format.json { render :show, status: :created, location: @task }
    end
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
