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

    # For now, this will go unused, because we have a set number of books for people to read.
    def create
        @todo = Todoo.new(todo_params)
        @todo.user = current_user
        if @todo.save
            redirect_to todoo_index_path, :notice => "Your book was created!"
        else
            render "new"
        end
    end

    def update
        @todo = Todoo.find(params[:id])
        if @todo.update_attribute(:done, true)
            redirect_to todoo_index_path, :notice => "Your book was marked as finished!"
        else
            redirect_to todoo_index_path, :notice => "Your book was unable to be finished for some reason!"
        end
    end

    def destroy
        @todo = Todoo.find(params[:id])
        if @todo.update_attribute(:done, false)
            redirect_to todoo_index_path, :notice => "You never finished that book. Liar."
        else
            redirect_to todoo_index_path, :notice => "What what!"
        end
        # Were this a standard todo list, we would have the below for destroyed items:
        # @todo.destroy
        # redirect_to todoo_index_path, :notice => "Your todo item is deleted"
    end

    def todo_params
        params.require(:todoo).permit(:name, :done)
    end

end
