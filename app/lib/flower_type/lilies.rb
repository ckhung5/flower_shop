# frozen_string_literal: true

class Lilies < Flower

	BUNDLE_IN_THREE = 3
	BUNDLE_IN_SIX = 6
	BUNDLE_IN_NINE = 9
	
	def self.code_name
		'L09'
	end

	private 

	def total(combinations)
		total = 0.0
		
		combinations.each do |number|
			case number
			when BUNDLE_IN_NINE
				total += 24.95
			when BUNDLE_IN_SIX
				total += 16.95
			when BUNDLE_IN_THREE
				total += 9.95
			end
		end

		total.round(2)
	end

	def bundles
		[BUNDLE_IN_NINE, BUNDLE_IN_SIX, BUNDLE_IN_THREE]
	end
end