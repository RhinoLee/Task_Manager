class ApplicationController < ActionController::Base
  before_action :set_current_user

  unless Rails.env.test? 
    http_basic_authenticate_with :name => ENV["HTTP_BASIC_USER"], 
                                 :password => ENV["HTTP_BASIC_PASSWORD"] 
  end

  def set_current_user
    if session[:id] 
      Current.user = User.find_by(id: session[:id])
      # current_user = User.find_by(id: session[:id])
    end
  end

end
