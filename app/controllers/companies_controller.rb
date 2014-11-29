class CompaniesController < ApplicationController
	 def new
  	@company = Company.new
  end

 	def create
  	@company = Company.create(params.require(:company).permit(:address, :title,
  											 :description, :latitude, :longitude))
  	@company.save
  end
end