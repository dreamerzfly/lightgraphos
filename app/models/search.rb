class Search < ActiveRecord::Base
	def gears
		@gears ||= find_gears
	end

private

	def find_gears
		gears = Gear.order(:title)
		gears = gears.where("brand = ?", brand) if brand.present?
		gears = gears.where("component = ?", component) if component.present?
		gears = gears.where("daily_rental_price >= ?", min_price) if min_price.present?
		gears = gears.where("daily_rental_price <= ?", max_price) if max_price.present?
		gears
	end
end
