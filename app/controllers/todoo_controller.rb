class TodooController < ApplicationController
  
  def index 
    @todos = Todoo.where(done: false)
    @todone = Todoo.where(done: true)
  end
  
  
  def new
    @todo = Todoo.new
    
  end
  
 
  
  def create 
    @todo = Todoo.new(todo_params)
    
    if @todo.save
      redirect_to todoo_index_path, :notice => "Your todo itme was created!"
    else
      render "new"
    end
  end
  
  
  def update
    
    @todo = Todoo.find(params[:id])
    
    if @todo.update_attribute(:done, true)
      redirect_to todoo_index_path, :notice => "Your todo item was marked as done!"
    else
      redirect_to todoo_index_path, :notice => "Your todo item was unable to be marked as done!"
    end
    
  end
  
  def destroy
    @todo = Todoo.find(params[:id])
    @todo.destroy
    redirect_to todoo_index_path, :notice => "Your todo item is deleted"
    
  end
  
  def todo_params
    params.require(:todoo).permit(:name, :done)
  end
  
  
  
  
  
end
