class StaticPagesController < ApplicationController
  before_action :authorized, except: [:index]
  def index
    @users = User.all
    @projects = Project.all
  end
end
