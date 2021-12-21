class SessionsController < ApplicationController
 skip_before_action :verify_authenticity_token, :only => :create
  def new
    @user = User.new
  end

  def create
    #look up user in data base
    @user = User.find_by(email: user_params[:email])
    #compare passwords
    if @user && @user.password == user_params[:password]
      cookies.encrypted.signed[:user_id] = @user.id
      #helper method .signed helps encrypt!!!!
      #      cookies.encrypted.signed[:user_id] = @user.id ....... doestn work!! need to change routes.rb file!!
      
      redirect_to root_path,  :flash => { :notice => "log in successful!"}
  
      
    else
      flash.now[:error] = "invalid email or password "
      render :new
    
    end
  end
   
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
