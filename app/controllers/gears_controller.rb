class GearsController < ApplicationController
	before_action :signed_in_user

  def new
  	@gear = current_user.gears.build()
  end

  def create
  	@gear = current_user.gears.build(gear_params)
  	if @gear.save
  		#handle a successful post of gear
  		flash[:success] = "Gear posted!"
  		redirect_to current_user #redirects to current users profile page
  	else
  		render 'new' #renders the post gear page but should display error messages if any
  	end
  end

  private

  	# this code enables requirements of paraments in the post gear form
  	def gear_params
  		params.require(:gear).permit(:title, :brand, :component, :daily_rental_price, :description)
  	end

end
