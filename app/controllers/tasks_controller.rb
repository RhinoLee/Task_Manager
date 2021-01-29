class TasksController < ApplicationController

  def index 
    @tasks = Task.order(created_at: :desc)
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
    @task = Task.find(params[:id])
  end

  def edit 
    @task = Task.find(params[:id])
  end

  def update 
    @task = Task.find(params[:id]) 

    if @task.update(task_params)
      redirect_to task_path(@task), notice: "任務更新成功！"
    else
      render :edit
    end
  end

  def destroy 
    @task = Task.find(params[:id]) 
    @task.destroy
    redirect_to :root, notice: "任務已刪除"
  end


  private 
  def task_params 
    params.require(:task).permit(:title, :content)
  end

end
