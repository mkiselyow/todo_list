class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private 
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def authorized
      redirect_to root_url if current_user == nil
    end

    def correct_user
      @user = User.find_by_id(params[:id])
      redirect_to root_url unless current_user == @user
    end
    helper_method :correct_user

    def correct_user_tasks
      if current_user && @task
        unless @task.user == current_user
          redirect_to root_path, notice: 'You can\'t change task for this project.'
        end
      end
    end
    helper_method :correct_user_tasks
end
