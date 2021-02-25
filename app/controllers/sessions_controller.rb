class SessionsController < ApplicationController

  def new 
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to :root, notice: "登入成功"
    else 
      flash[:alert] = '信箱或密碼輸入錯誤'
      render :new
    end

  end

  def destroy 
    session[:user_id] = nil
    redirect_to :root, notice: '已登出'
  end

end
