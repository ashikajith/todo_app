class TodosController < ApplicationController

	def index
		@todos = Todo.order('position ASC')
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
		@todo = Todo.find(params[:id])
		if @todo.update_attributes(todo_item: params[:todo][:todo_item])
			flash[:notice] = "Updated Successfully"
			redirect_to todos_path
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

	def sort
		@todos = Todo.all
		@todos.each do |todo|
			# todo.position = params['item'].index(todo.id + 1)
			p " ==================================="
			puts params['item']
			todo.update_attributes!(:position => (params['item'].index((todo.id + 1).to_s)))
		end
		render :nothing => true	
	end
end
