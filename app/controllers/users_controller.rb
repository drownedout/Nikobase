class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def search
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user.destroy
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:id_number, :firstname, :lastname, :email)
	end

	def find_user
		@user = User.find(params[:id])
	end
end
