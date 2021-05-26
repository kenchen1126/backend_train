class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    if task.save
      flash[:notice] = "成功建立任務"
      redirect_to tasks_path
    else
      render :new
      flash[:notice] = "任務建立失敗"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "成功修改任務"
      redirect_to tasks_path
    else
      render :edit 
      flash[:notice] = "任務修改失敗"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "任務已刪除"
    else
      flash[:notice] = "任務刪除失敗"
    end
    redirect_to tasks_path
  end

  private
  
  def task_params
    params.require(:task).permit(:name, :description, :priority, :status, :start_at, :end_at)
  end
end
