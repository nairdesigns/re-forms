class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    helper_method :current_user
    def current_user
        User.find(cookies.signed[:user_id])
                # User.find(cookies.encrypted.signed[:user_id])  .....doesnt work!!! need to change route.rb file

    end
    
end
