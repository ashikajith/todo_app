class TodosController < ApplicationController

	def index
		@todos = Todo.all
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(params[:todo])
		if @todo.save
			flash[:notice] = "Todo is saved successfully"
			redirect_to todos_path
		else
			flash[:error] = @todo.errors.full_messages.to_sentence
			render 'new'
		end		
	end

	def edit
		@todo = Todo.find(params[:id])
	end


	def update
		@todo = Todo.find(params[:todo])
		if @todo.update(params)
			flash[:notice] = "Updated Successfully"
			redirect_to :index
		else
			flash[:error] = @todo.errors.full_messages.to_sentence
			render "edit"	
		end	
	end

	def show
	end

	def delete
		@todo = Todo.find(params[:id])
		if @todo.destroy
			flash[:notice] = "Deleted Successfully"
		else
			flash[:error] = @todo.errors.full_messages.to_sentence
		end
		redirect_to :index			
	end
end
