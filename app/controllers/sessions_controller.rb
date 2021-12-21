class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #look up user in data base
    @user = User.find_by(email: user_params[:email])
    #compare passwords
    if @user && @user.password == user_params[:password]
      cookies[:user_id] = @user.id
      redirect_to posts_path
    else
      flash.now[:notice] = "invalid email or password"
      render :new
    end
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
