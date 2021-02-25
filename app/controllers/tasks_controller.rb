class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index 
    @tasks = Task.sort_by_createtime
  end

  def new 
    @task = Task.new
  end

  def create 
    @user = User.first
    @task = @user.tasks.build(task_params)
    # @task = Task.new(task_params)

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

  def filter 

    @tasks = Task.search(params[:title], params[:status])
    sort_task(params[:sort], @tasks) if params[:sort]

    render json: {tasks: @tasks }

  end


  private 
  def task_params 
    params.require(:task).permit(:title, :content, :end_time, :status, :search, :level)
  end

  def find_task 
    @task = Task.find(params[:id])
  end

  def sort_task(sort = nil, tasks = nil)
    case sort
    when "end_time"
      @tasks = tasks.sort_by_endtime
    when "create_time"
      @tasks = tasks.sort_by_createtime
    when "level_desc" 
      @tasks = tasks.sort_by_level_desc
    when "level_asc" 
      @tasks = tasks.sort_by_level_asc
    end
  end

end
