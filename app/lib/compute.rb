require_relative "flower_shop"

module Compute
	module Result
		class << self
			def calculate_order
				order_hash = JsonParser.data

				flowers_object = order_hash["flowers"].map do |code, amount|
					flower_object(amount, code)
				end
				flowers_object.each(&:print_result)
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
end