require_relative "flower_shop"

module Compute
	module Result
		class << self
			def calculate_order
				order_hash = JsonParser.data
				roses = Roses.new(order_hash["flowers"][Roses::CODE_NAME])
				lilies = Lilies.new(order_hash["flowers"][Lilies::CODE_NAME])
				tulips = Tulips.new(order_hash["flowers"][Tulips::CODE_NAME])
				[roses, lilies, tulips].each(&:print_result)
			end
		end
	end
end