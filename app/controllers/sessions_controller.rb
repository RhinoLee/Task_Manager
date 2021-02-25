class SessionsController < ApplicationController

  def destroy 
    session[:user_id] = nil
    redirect_to :root, notice: '已登出'

  end

end
