# frozen_string_literal: true

class Flower
	attr_accessor :order_number

	def initialize(order_number)
		@order_number = order_number
	end

	def code_name
		raise NotImplementedError, "subclass did not define #create"
	end

	def calculate
		return 0 if order_number == 0
		combinations = possible_combinations

		return nil unless !combinations.empty?
		total(combinations)
	end

	private

	def possible_combinations
		bundles.sort.reverse.permutation(bundles.length).to_a.each do |permutation_array|
			combinations = []
			flowers = order_number

			permutation_array.each do |number|
				while flowers >= number
					flowers -= number
					break if flowers.negative?
					combinations.push(number)
				end
				return combinations if flowers == 0
			end
		end
		[]
	end

	def bundles
		[]
	end
end