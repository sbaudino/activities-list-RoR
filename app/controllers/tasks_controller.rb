class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
  end
  
  def create
    
  end
  
  def destroy
    
  end
  
  private
  def task_params
    params.require(:taks).permit(:name, :date, :active)
  end
end