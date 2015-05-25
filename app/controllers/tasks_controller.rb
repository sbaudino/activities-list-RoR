class TasksController < ApplicationController
  before_action :find_list, only: [:index, :new, :create]
  
  def index
    @tasks = @list.tasks.where(active: true)
  end
  
  def new
  end
  
  def create   
    if @list.tasks.create(task_params)
      redirect_to lists_path
    else
      render 'new'
    end
  end
  
  def destroy
    
  end
  
  private
  def task_params
    params.require(:task).permit(:name, :date, :active)
  end
  
  def find_list
    @list = List.find(params[:list_id])
  end
end