class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    helper_method :current_user
    def current_user
        if session[:user_id]
        #session is much better than using encrypted or signed
        User.find(session[:user_id])
                # User.find(cookies.encrypted.signed[:user_id])  .....doesnt work!!! need to change route.rb file
        end
    end
    
end
