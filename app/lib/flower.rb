# frozen_string_literal: true

class Flower
	attr_accessor :order_number
	attr_reader :records, :code_name

	def initialize(order_number)
		@order_number = order_number
		@records = {}
	end

	def calculate
		return 0 if order_number == 0
		combinations = possible_combinations

		return nil unless !combinations.empty?
		total(combinations)
	end

	def print_result
		calculatd_result = calculate
		if calculatd_result.nil?
			puts "The #{code_name} has only #{order_number} which can not be a bundle"
		else
			puts "#{order_number} #{code_name} $#{calculatd_result}"
			records.each do |bundle_number, count|
				puts "#{count} X #{bundle_number} $#{get_price(bundle_number)}"
			end
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