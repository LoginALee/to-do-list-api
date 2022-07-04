class TodosController < ApplicationController
  def index
    todos = if logged_in_user
      logged_in_user.todos
    else
      Todo.order("created_at DESC")
    end
    render json: todos
  end

  def show
    todo = Todo.find(params[:id])
    render json: todo
  end

  def create
    todo = Todo.create(todo_params)
    todo.user = logged_in_user
    todo.save!
    render json: todo
  end

  def update
    todo = Todo.find(params[:id])
    todo.update(todo_params)
    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content, status: :ok
  end

  private
    def todo_params 
      params.require(:todo).permit(:title, :done)
    end
end
