# frozen_string_literal: true

class Tulips < Flower

	BUNDLE_IN_THREE = 3
	BUNDLE_IN_FIVE = 5
	BUNDLE_IN_NINE = 9
	
	def self.code_name
		'T58'
	end

	private 

	def total(combinations)
		total = 0.0
		combinations.each do |number|
			case number
			when BUNDLE_IN_NINE
				total += 16.99
			when BUNDLE_IN_FIVE
				total += 9.95
			when BUNDLE_IN_THREE
				total += 5.95
			end
		end

		total.round(2)
	end

	def bundles
		[BUNDLE_IN_NINE, BUNDLE_IN_FIVE, BUNDLE_IN_THREE]
	end
end