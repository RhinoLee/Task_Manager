class Api::V1::UtilsController < ApplicationController

  def sort_end_time 
    tasks = Task.order(end_time: :asc)

    render json: { status: 'ok', tasks: tasks }
  end

  def sort_create_time 
    tasks = Task.order(created_at: :desc)

    render json: { status: 'ok', tasks: tasks }
  end

end
