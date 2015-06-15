class TasksController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_list, only: [:index, :new, :create]
  
  def index
    @tasks = @list.tasks.where(active: true)
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @list.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        @tasks = @list.tasks.where(active: true)
        format.html { redirect_to root_path }
        format.js
      else
        error_block = -> { render :new  }
        format.html &error_block
        format.js &error_block
      end
    end
  end
  
  def destroy
    
  end
  
  private
  def task_params
    params.require(:task).permit(:name, :date, :active, :list_id)
  end
  
  def find_list
    @list = List.find(params[:list_id])
  end
end