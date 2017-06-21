class StaticPagesController < ApplicationController
  before_action :authorized, except: [:index, :sort]
  before_action :correct_user_tasks
  
  def index
    @users = User.all
    @projects = Project.all
    @user = User.new
    @project = Project.new
    #task ajax create
    @task = Task.new
    #@project = Project.find(params[:project_id])
  end

  def sort
    params[:order].each do |key,value|
      @task = Task.find(value[:id])
      if @task.user == current_user
        Task.find(value[:id]).update_attribute(:priority,value[:position])
      # else
      #   respond_to do |format|
      #     format.js { redirect_to root_path, notice: 'There was a problem.' }
      #     format.html { redirect_to root_path, notice: 'There was a problem.' }
      #     format.json { redirect_to root_path, notice: 'There was a problem.' }
      #   end
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
