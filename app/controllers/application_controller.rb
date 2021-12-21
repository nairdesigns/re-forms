class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    helper_method :current_user
    def current_user
        User.find(cookies[:user_id])
        
    end
    
end
