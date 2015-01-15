class TodooController < ApplicationController

  before_filter :set_current_user

  def set_current_user
    @current ||= current_user
  end

  def index
    @todos = Todoo.where(user_id: current_user.id, done: false)
    @todone = Todoo.where(user_id: current_user.id, done: true)
  end

  def new
    @todo = Todoo.new
  end

  def create
    puts "-----------------------#{todo_params}-----------------------"
    puts "--------------------#{@todos}--------------------"
    @todo = Todoo.new(todo_params)
    @todo.user = current_user
    if @todo.save
      redirect_to todoo_index_path, :notice => "Your todo item was created!"
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
