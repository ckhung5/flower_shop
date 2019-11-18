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
			tmp_flower_counts = order_number

			permutation_array.each do |number|
				while tmp_flower_counts >= number
					tmp_flower_counts -= number
					break if tmp_flower_counts.negative?
					combinations.push(number)
				end
				return combinations if tmp_flower_counts == 0
			end
		end
		[]
	end

	def bundles
		[]
	end
end