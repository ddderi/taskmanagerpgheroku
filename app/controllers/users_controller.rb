class UsersController < ApplicationController
 
    before_action :admin, only: [:index, :destroy]

    def index
        @users = User.all
        @current = current_user
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
    end

    def create 
         @user = User.new(user_params)
        if @user.valid?
           @user.save
           session[:user_id] = @user.id
            redirect_to '/home'
        else 
            render :new, :status => 202
        end
    end

    def edit
        @current = current_user
        @user = User.find_by(id: params[:id])
    end

    def update
        @current = current_user
        task = Task.find_by(id: params[:id])
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
                if Current.user.manager 
                    redirect_to home_path, :notice => 'user updated'
                else
                    redirect_to user_path(@user), :notice => 'Updated'
                end

        else 
            puts 'Not updated'
            render :edit
        end
    end

    def destroy

    end
    private

    def user_params
        params.require(:user).permit(:name, :nameclean, :manager, :email, :password, :password_confirmation, task_ids: [])
    end
end
