class TaskListsController < ApplicationController


  def create
    @task_list = TaskList.new
  end

end
