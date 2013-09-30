class GearsController < ApplicationController
	before_action :signed_in_user
  before_action :correct_user,   only: :destroy

  def new
  	@gear = current_user.gears.build()
  end

  def destroy
    @gear.destroy
    redirect_to current_user
  end

  def create
  	@gear = current_user.gears.build(gear_params)
  	if @gear.save
  		#handle a successful post of gear
  		flash[:success] = "Gear posted!"
  		redirect_to current_user #redirects to current users profile page
  	else
      @posts_items = []
  		render 'new' #renders the post gear page but should display error messages if any
  	end
  end

  def show
    @gear = current_user.gears.find(params[:id]) #add code
  end

  def searchgear
    @gears = Gear.search(params[:search])
  end

  private

  	# this code enables requirements of paraments in the post gear form
  	def gear_params
  		params.require(:gear).permit(:title, :brand, :component, :daily_rental_price, :description)
  	end

    def correct_user
      @gear = current_user.gears.find_by(id: params[:id])
      redirect_to current_user if @gear.nil?
    end

end
