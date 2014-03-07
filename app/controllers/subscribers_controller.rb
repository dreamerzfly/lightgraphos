class SubscribersController < ApplicationController

	def create
		@subscriber = Subscriber.new(subscriber_params)
		@subscriber.save
		flash[:success] = "Welcome to CLYQE!"
		redirect_to home_path
	end

	def new
		@subscriber = Subscriber.new
	end

	private

	    def subscriber_params
    		params.require(:subscriber).permit(:email)
    	end


end
