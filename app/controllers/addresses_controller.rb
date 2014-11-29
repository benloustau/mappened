class AddressesController < ApplicationController

	before_action :set_address, only: [ :destroy]

	def index
    @address = Address.new
    @addresses = Address.all
  	end

  	def new
  		@address = Address.new
  	end

	def create
		@address = Address.new(address_params)
		unless address_params.empty?
      	@address.save
      	flash[:notice] = "New address created!"
    	else
      	flash[:notice] = "Sorry - Something went wrong!"
    	end
    	redirect_to user_addresses_path 
	end

	def destroy
		if current_user.id == @address.user.id
      	@address.destroy
      	flash[:notice] = "address was deleted."
      	redirect_to root_path
    	else
      	flash[:notice] = "Could not delete address"
      	redirect_to user_addresses_path
    	end 
	end

	private

	def address_params
  		params.require(:address).permit(:addresss, :title, :longitude, :latitude)
	end

	def set_address
    @address = Address.find(params[:id])
  	end

end