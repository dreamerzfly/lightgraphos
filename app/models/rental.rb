require 'balanced'

class Rental < ActiveRecord::Base

	attr_reader :errors

	def initialize(email, amount, credit_card_hash)
		logger.debug "initalize rental"
		logger.debug "email is #{email} and amount is #{amount} and credit card hash is #{credit_card_hash}"
		@email = email
		@amount = (amount * 100).to_i
		@credit_card_hash = credit_card_hash
		@renter = nil
		@card = nil
		@errors = []
	end

	def charge
		begin
			logger.debug "begin charge"
			create_card
			find_or_create_renter
			debit_renter
			credit_gear_owner
			return true
		rescue
			return false
		end
	end

	private

		def create_card
			begin
				logger.debug "created card. credit card hash is #{@credit_card_hash}"
				#@card = Balanced::Card.new(@credit_card_hash).save
				@card = Balanced::Card.new(
					:name => 'John Doe',
					:expiration_month => '12',
					:number => '5105105105105100',
					:expiration_year => '2020',
					:security_code => '123'
				).save
				logger.debug "finished created card"
			rescue
				@errors << 'Your credit card is invalid'
			end
		end		

		def find_or_create_renter
			begin
				renter = Balanced::Account.find_by_email(@email)
				logger.debug "email is #{@email} and card uri is #{@card.uri}"
				if renter.present?
					logger.debug "renter present yes"
					@renter = renter
					logger.debug "renter present assigned"
				else
					logger.debug "create new renter"
					@renter = Balanced::Marketplace.my_marketplace.create_buyer(@email, @card.uri)
					logger.debug "finish creating new renter"
				end
			rescue
				@errors << 'Your account is invalid'
			end
		end

		def debit_renter
			begin
				logger.debug "begin debit renter"
				payment = @renter.debit(@amount, "Gear rental from ClyQe")
				logger.debug "finish debit renter"
			rescue
				logger.debug "your credit card could not be charged"
				@errors << 'Your credit card could not be charged'
			end
		end

		def credit_gear_owner
			begin
				logger.debug "begin credit gear owner"
				Balanced::Marketplace.my_marketplace.owner_account.credit(amount)
				logger.debug "finish credit gear owner"
			rescue
				logger.debug "your credit card payment did not go through"
				@errors << 'Your credit card payment did not go through'
			end
		end

end
