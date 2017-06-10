class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authorized, except: [:index, :new]
  before_action :correct_user_tasks#, :except => [:edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    #@tasks = Task.all
    #@tasks = Task.where(project_id: project_id)
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @project = Project.find(params[:project_id])
    if current_user == @project.user
      @tasks = @project.tasks.build(task_params)
      @tasks.user_id = current_user.id
    else
      redirect_to root_path, notice: 'You can\'t create task for this project.'
    end
  end

  # GET /tasks/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks.build(task_params)
    @tasks.user_id = current_user.id

    respond_to do |format|
      if @tasks.save
        format.html { redirect_to root_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to root_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.fetch(:task, {}).permit(:name, :priority, :status, :deadline, :project_id, :user_id)
    end

    def correct_user_tasks
      if current_user && @task
        if @task.user == current_user
          redirect_to root_path, notice: 'You can\'t change task for this project.'
        end
      end
    end
end
