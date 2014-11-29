class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [ :show, :update, :edit]

  def edit

  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "We have registered your address"
      redirect_to current_user
    else
      flash[:alert] = "There was a problem"
      render :edit
    end
  end

  def show
      @hash = Gmaps4rails.build_markers(current_user) do |current_user, marker|
        marker.lat current_user.latitude
        marker.lng current_user.longitude
      end
    end
      

	private

  def user_params
      params.require(:user).permit( :username, :email, 
                                    :password, :location, :address,
                                    :title, :latitude, :longitude)
  end

	def set_user
		@user = User.find_by_username(params[:id])
	end

end