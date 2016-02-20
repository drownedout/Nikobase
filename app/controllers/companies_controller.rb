class CompaniesController < ApplicationController
	before_action :find_company, only: [:edit, :update, :show]
	before_action :authenticate_admin!

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

	private

	def company_params
		params.require(:company).permit(:name, :mou)
	end

	def find_company
		@company = Company.find(params[:id])
	end
end
