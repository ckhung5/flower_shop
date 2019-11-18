# frozen_string_literal: true

class Rose < Flower

	BUNDLE_IN_FIVE = 5
	BUNDLE_IN_TEN = 10

	def self.code_name
		'R12'
	end

	def calculate
		total = 0.0
		remaining_flower = order_number
		
		return 0 if order_number == 0
		return nil unless is_a_bundle?

		if order_number/BUNDLE_IN_TEN != 0
			total += (order_number/BUNDLE_IN_TEN) * 12.99

			remaining_flower -= (order_number/BUNDLE_IN_TEN)*BUNDLE_IN_TEN
		end

		if remaining_flower/BUNDLE_IN_FIVE != 0
			total += remaining_flower/BUNDLE_IN_FIVE * 6.99
		end

		total
	end

	def is_a_bundle?
		order_number % BUNDLE_IN_FIVE == 0 || order_number % BUNDLE_IN_TEN == 0
	end
end