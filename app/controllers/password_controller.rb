class PasswordController < ApplicationController
  before_action :require_logged_in

  def edit 

  end

  def update
    if Current.user.update(password_params)
      redirect_to :root, notice: "密碼更新成功！"
    else 
      render :edit
    end
  end
  
  private 

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
