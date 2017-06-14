class StaticPagesController < ApplicationController
  before_action :authorized, except: [:index]
  before_action :correct_user_tasks
  
  def index
    @users = User.all
    @projects = Project.all
  end

  def sort
    params[:order].each do |key,value|
      @task = Task.find(value[:id])
      if @task.user == current_user
        Task.find(value[:id]).update_attribute(:priority,value[:position])
      end
    end
    render :nothing => true
  end

  private

    def correct_user_tasks
      if current_user && @task
        unless @task.user == current_user
          redirect_to root_path, notice: 'You can\'t change task for this project.'
        end
      end
    end
end
