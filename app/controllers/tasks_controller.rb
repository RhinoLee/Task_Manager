class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index 
    case params[:sort]
    when "end_time"
      @tasks = Task.order(end_time: :asc)
    when "create_time"
      @tasks = Task.order(created_at: :desc)
    when nil
      @tasks = Task.order(created_at: :desc)
    end
  end

  def new 
    @task = Task.new
  end

  def create 
    @task = Task.new(task_params)

    if @task.save
      redirect_to :root, notice: "任務新增成功！"
    else 
      render :new
    end

  end

  def show 
  end

  def edit 
  end

  def update 

    if @task.update(task_params)
      redirect_to task_path(@task), notice: "任務更新成功！"
    else
      render :edit
    end
  end

  def destroy 
    @task.destroy
    redirect_to :root, notice: "任務已刪除"
  end


  private 
  def task_params 
    params.require(:task).permit(:title, :content, :end_time)
  end

  def find_task 
    @task = Task.find(params[:id])
  end
end
