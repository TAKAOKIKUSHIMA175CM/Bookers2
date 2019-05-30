class UsersController < ApplicationController
	before_action :authenticate_user!


	def top
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to books_path
	end

	def index
		@users = User.all
		@user = current_user
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = Book.where(user_id: @user.id)
	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to user_path(current_user.id)
		end

	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] ="You have updated user successfully."
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

    private

    def user_params
    	params.require(:user).permit(:name, :introduction, :profile_image)
    end
end

