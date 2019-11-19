require_relative "flower_shop"

module Compute
	class << self
		def calculate_order
			order_hash = JsonParser.data

			flowers_object = order_hash["flowers"].map do |code, amount|
				flower_object(amount, code)
			end
			result_hash = {}
			result_hash["orders"] = []
			flowers_object.map do |flower|
				result_hash["orders"] << flower.generate_result
			end
			result_hash.to_json
		end

		private

		def flower_object(amount, code)
			case code
			when Roses::CODE_NAME
				Roses.new(amount)
			when Lilies::CODE_NAME
				Lilies.new(amount)
			when Tulips::CODE_NAME
				Tulips.new(amount)
			end
		end
	end
end