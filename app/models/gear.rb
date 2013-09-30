class Gear < ActiveRecord::Base
	belongs_to :user
	# validates is used on the new gears form to show errors messages if fields are not populdated correctly
	validates :user_id, presence: true
	validates :title, presence: true
	validates :brand, presence: true
	validates :component, presence: true
	validates :daily_rental_price, presence: true
	validates :daily_rental_price, :numericality =>{:greater_than => 0}
	validates :description, presence: true

	def self.search(search)
		if search
		find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
		#else
			#find(:all)
		end
	end
end
