class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_admin!

	def index
		if params[:company].blank?
			@users = User.page(params[:page]).per(50).order("ccs_date ASC")
		else
			@company_id = Company.find_by(name: params[:company]).id
			@users = User.page(params[:page]).per(50).order("ccs_date ASC").where(company_id: @company_id)
		end
	end

	def search
	    if params[:search].present?
	      @users = User.search(params[:search])
	    else
	      @users = User.all
	    end
  	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
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

	def import
		begin
			User.import(params[:file])
			redirect_to root_path, notice: "Users Added Successfully"
		rescue
			redirect_to root_path, notice: "Error"
		end
	end

	private

	def user_params
		params.require(:user).permit(:id_number, :firstname, :lastname, :email, :company_id, 
			:ccs_type, :ccs_date, :ces_type, :ces_date, :notes)
	end

	def find_user
		@user = User.find(params[:id])
	end
end
