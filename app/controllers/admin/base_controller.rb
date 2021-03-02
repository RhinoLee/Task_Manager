class Admin::BaseController < ApplicationController
  layout 'backend'
  before_action :admin_user

  def admin_user
    redirect_to :root, notice: '需要管理員權限' unless Current.user.role == 'admin'
  end
end
