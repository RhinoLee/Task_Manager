class Admin::UsersController < ApplicationController
  layout 'backend'
  before_action :find_user, only: [:edit, :show, :update, :destroy]
  
  def index 
    @users = User.order(created_at: :desc)
  end

  def new 
    @user = User.new
  end

  def create 
    @user = User.new(user_params)

    if @user.save 
      redirect_to :admin_root, notice: '使用者新增成功'
    else 
      render :new
    end

  end

  def show 
    @tasks = @user.tasks
  end

  def edit
  end

  def update
  end

  def destroy 
    @user.destroy

    redirect_to :admin_root
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def find_user 
    @user = User.find_by(id: params[:id])
  end



end
