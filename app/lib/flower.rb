# frozen_string_literal: true

class Flower
	attr_accessor :order_number
	attr_reader :records, :code_name

	def initialize(order_number)
		@order_number = order_number
		@records = {}
		@code_name = code_name
	end

	def calculate
		return 0 if order_number == 0
		combinations = possible_combinations

		return nil unless !combinations.empty?
		total(combinations)
	end

	def print_result
		puts "#{order_number} #{code_name} $#{calculate}"
		records.each do |bundle_number, count|
			puts "#{count} X #{bundle_number} $#{get_price(bundle_number)}"
		end
		puts "--------------------------------------------------------"
	end

	def code_name
		""
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
					adding_records(number)
					combinations.push(number)
				end
				return combinations if tmp_flower_counts == 0
			end
		end
		[]
	end

	def adding_records(number)
		if records[number]
			records[number] += 1
		else
			records[number] = 1
		end
	end

	def bundles
		[]
	end

	def get_price(bundle_number)
		nil
	end
end