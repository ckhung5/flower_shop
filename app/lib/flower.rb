# frozen_string_literal: true

class Flower
	attr_accessor :order_number

	def initialize(order_number)
		@order_number = order_number
	end

	def code_name
		raise NotImplementedError, "subclass did not define #create"
	end
end