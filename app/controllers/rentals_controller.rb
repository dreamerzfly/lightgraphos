class RentalsController < ApplicationController

	def new
	end

	def create
		@rental = Rental.new("mnm@mailinator.com", 100.0, params[:rental])
		logger.debug "RentalsController.create ; params payment is #{:rental}"
		#@rental = Rental.new(current_user.email, 100.0, params[:payment])
		if @rental.charge
			flash[:success] = 'Thanks for the cash!'
			redirect_to root_path
		else
			flash[:error] = @rental.errors.first
			render :new
		end
	end

end