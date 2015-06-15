class ListsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_list, only: [:edit, :update, :destroy]
  
  def index
    @lists = current_user.lists if logged_in?
    render layout: 'lists_sidebar'
  end
  
  def new
    @list = List.new
  end
  
  def create
    @list = current_user.lists.build(list_params)
    respond_to do |format|
      if @list.save
        @lists = current_user.lists
        format.html { redirect_to root_path }
        format.js
      else
        error_block = -> { render :new  }
        format.html &error_block
        format.js &error_block
      end
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
    @lists = current_user.lists
  end
  
  private
  def list_params
    params.require(:list).permit(:name)
  end
  
  def find_list
    @list = List.find(params[:id])
  end
end