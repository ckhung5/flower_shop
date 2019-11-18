# frozen_string_literal: true

class Lilies < Flower

	BUNDLE_IN_THREE = {bundle_number: 3, cost: 9.95}
	BUNDLE_IN_SIX = {bundle_number: 6, cost: 16.95}
	BUNDLE_IN_NINE = {bundle_number: 9, cost: 24.95}
	CODE_NAME = 'L09'

	def code_name
		CODE_NAME
	end

	private

	def total(combinations)
		total = 0.0
		
		combinations.each do |number|
			case number
			when BUNDLE_IN_NINE[:bundle_number]
				total += BUNDLE_IN_NINE[:cost]
			when BUNDLE_IN_SIX[:bundle_number]
				total += BUNDLE_IN_SIX[:cost]
			when BUNDLE_IN_THREE[:bundle_number]
				total += BUNDLE_IN_THREE[:cost]
			end
		end

		total.round(2)
	end

	def bundles
		[BUNDLE_IN_NINE[:bundle_number], BUNDLE_IN_SIX[:bundle_number], BUNDLE_IN_THREE[:bundle_number]]
	end

	def get_price(number)
		result = 0
		[BUNDLE_IN_THREE, BUNDLE_IN_SIX, BUNDLE_IN_NINE].each do |bundle|
			result = bundle[:cost] if bundle[:bundle_number] == number
		end
		result
	end
end