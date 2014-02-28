class SubscribersController < ApplicationController

	def create
		@subscriber = Subscriber.new(subscriber_params)
		@subscriber.save
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
