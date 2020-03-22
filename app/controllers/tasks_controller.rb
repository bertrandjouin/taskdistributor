class TasksController < ApplicationController

  def new
    @user = current_user
    @task = Task.new()
    @tasks = @user.tasks
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to new_task_path
    else
      render :new
    end
  end

  def index
    @tasks = @user.tasks
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to new_task_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :user_id, :repeatable)
  end

end
