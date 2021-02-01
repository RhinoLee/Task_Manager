class ApplicationController < ActionController::Base
  unless Rails.env.test? 
    http_basic_authenticate_with :name => ENV["HTTP_BASIC_USER"], 
                                 :password => ENV["HTTP_BASIC_PASSWORD"] 
  end
end
