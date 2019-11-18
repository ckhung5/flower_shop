# frozen_string_literal: true

class Roses < Flower

	BUNDLE_IN_FIVE = 5
	BUNDLE_IN_TEN = 10

	def self.code_name
		'R12'
	end

	private 

	def total(combinations)
		total = 0.0
		combinations.each do |number|
			case number
			when BUNDLE_IN_FIVE
				total += 6.99
			when BUNDLE_IN_TEN
				total += 12.99
			end
		end

		total.round(2)
	end

	def bundles
		[BUNDLE_IN_TEN, BUNDLE_IN_FIVE]
	end
end