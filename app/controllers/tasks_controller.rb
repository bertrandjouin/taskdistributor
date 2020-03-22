class TasksController < ApplicationController

  def new
    @task = Task.new()
    @tasks = Task.all
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
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to new_task_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :user_id, :repeatable, :id)
  end

end
