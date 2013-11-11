class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to products_path, :notice => "Signed in!"
    else 
      flash[:alert] = "Email or password incorrect."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_path
  end

  private
  def session_param
    
  end
end
