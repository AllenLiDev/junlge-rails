class SessionsController < ApplicationController
  def new
  end

  def create
    #auth
    user = User.authenticate_with_credentials(params[:email], params[:password])
    # user auth passed
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
