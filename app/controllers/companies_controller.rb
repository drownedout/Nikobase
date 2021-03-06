class CompaniesController < ApplicationController
	before_action :find_company, only: [:edit, :update, :show, :destroy]
	before_action :authenticate_admin!

	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		@users = User.all
	end

	def edit
	end

	def update
		if @company.update(company_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@company.destroy
		redirect_to root_path
	end

	private

	def company_params
		params.require(:company).permit(:name, :email, :mou, :notes)
	end

	def find_company
		@company = Company.find(params[:id])
	end
end
