class ApplicationController < ActionController::Base
  before_action :set_current_user

  unless Rails.env.test? 
    http_basic_authenticate_with :name => ENV["HTTP_BASIC_USER"], 
                                 :password => ENV["HTTP_BASIC_PASSWORD"] 
  end

  def set_current_user
    if session[:user_id] 
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_logged_in
    redirect_to sign_in_path, alert: "請先登入" if Current.user.nil?
  end

end
