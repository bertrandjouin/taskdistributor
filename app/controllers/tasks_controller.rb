class TasksController < ApplicationController

  def new
    @user = current_user
    @task = Task.new()
    @tasks = @user.tasks
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @user = current_user
    @tasks = @user.tasks
    if @task.save
      redirect_to tasks_path
    else
      render 'index'
    end
  end

  def index
    @user = current_user
    @tasks = @user.tasks
    @players = @user.players
    @task = Task.new
    @mixandmatch = Mixandmatch.new()
  end

  def destroy
    @task = Task.find(params[:id])
    @attributions = @task.attributions
    @attributions.destroy_all
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :user_id, :repeatable)
  end

end
