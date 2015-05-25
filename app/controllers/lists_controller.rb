class ListsController < ApplicationController
  before_action :find_list, only: [:edit, :update, :destroy]
  
  def index
    @list = List.all
  end
  
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
 
    if @list.save
      redirect_to lists_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update 
    if @list.update(list_params)
      redirect_to lists_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @list.destroy
 
    redirect_to lists_path
  end
  
  private
  def list_params
    params.require(:list).permit(:name)
  end
  
  def find_list
    @list = List.find(params[:id])
  end
end