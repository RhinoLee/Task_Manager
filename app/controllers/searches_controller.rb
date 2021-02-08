class SearchesController < ApplicationController

  def search 

    @tasks = Task.order(created_at: :desc)
    @tasks = @tasks.filter_by_status(params[:status]) if params[:status].present?
    @tasks = @tasks.filter_by_title(params[:title]) if params[:title].present?

  end


end
