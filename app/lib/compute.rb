require_relative "flower_shop"

module Compute
	module Result
		class << self
			def calculate_order
				order_hash = JsonParser.data
				roses = Roses.new(order_hash["flowers"][Roses.code_name])
				lilies = Lilies.new(order_hash["flowers"][Lilies.code_name])
				tulips = Tulips.new(order_hash["flowers"][Tulips.code_name])
				print_result(roses, lilies, tulips)
			end

			private

			def print_result(roses, lilies, tulips)
				json_object = {
					Roses.code_name => roses.calculate,
					Lilies.code_name => lilies.calculate,
					Tulips.code_name => tulips.calculate
				}
				puts JSON.pretty_generate(json_object)
			end
		end
	end
end