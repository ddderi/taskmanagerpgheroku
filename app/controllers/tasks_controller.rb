class TasksController < ApplicationController
    before_action :require_logged_in
    before_action :admin, only: [:new, :create, :index, :edit, :update]
    
  
    def show
        @current = current_user
        @task = Task.find_by(id: params[:id])
    end

    def index
        @current = current_user
        @tasks = Task.all

    end

    def new
        @current = current_user
        @task = Task.new
      
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            puts params
          
        redirect_to task_path(@task)
        else 
            puts params 
            
            render :new, :status => 202
        end
    end

    def edit
        @current = current_user
        @task = Task.find_by(id: params[:id])
    end

    def update
        @task = Task.find_by(id: params[:id])
        @task.update(task_params)
        if @task.update(task_params)
            if !@user.manager    
            redirect_to '/home'
            else 
            redirect_to tasks_path
            end
        else
            puts 'not updated'
            redirect_to tasks_path
        end
    end

    def destroy
        @task = Task.find_by(id: params[:id])
        @task.destroy
        redirect_to '/tasks', :notice => 'Task has been deleted'
    end

    private 
    def task_params
        params.require(:task).permit(:name, :description, :created_at, :donedate, :done, :deadline, user_ids: [])
    end
end
