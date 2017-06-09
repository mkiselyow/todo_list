class StaticPagesController < ApplicationController
  before_action :authorized, except: [:index]
  before_action :correct_user_tasks
  def index
    @users = User.all
    @projects = Project.all
  end

  def sort
    params[:order].each do |key,value|
      @task =Task.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end
end
