class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :create

  def new
  end


  def create

  
     @current = current_user
     @user = User.find_by(name: params[:user][:name])
    
    if @user
      if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/home'
      else
        flash.now[:notice] = 'incorrect name or password'
      render :new
      end
    else 
      flash.now[:notice] = 'incorrect name or password'
      render :new
    end
  end


  def destroy
    reset_session
    redirect_to '/login'
  end

  private

 
    
end
