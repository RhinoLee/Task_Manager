class SearchesController < ApplicationController

  def search 
    if params[:title]
      title = params[:title]
      @tasks = Task.where("title LIKE ? ", "%#{title}%")  
    else 
      @tasks = Task.order(created_at: :desc)
    end 
  end

end
