# frozen_string_literal: true

module Compute
  class << self
    def calculate_order
      order_hash = JsonParser.parse

      flowers_object = order_hash['flowers'].map do |code, amount|
        flower_object(amount, code)
      end
      result_hash = {}
      result_hash['orders'] = []
      flowers_object.map do |flower|
        result_hash['orders'] << flower.generate_result
      end
      result_hash.to_json
    end

    private

    def flower_object(amount, code)
      case code
      when Roses::CODE
        Roses.new(amount)
      when Lilies::CODE
        Lilies.new(amount)
      when Tulips::CODE
        Tulips.new(amount)
      end
    end
  end
end
