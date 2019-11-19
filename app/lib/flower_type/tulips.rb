# frozen_string_literal: true

class Tulips < Flower
  BUNDLE_IN_THREE = { bundle_number: 3, cost: 5.95 }.freeze
  BUNDLE_IN_FIVE = { bundle_number: 5, cost: 9.95 }.freeze
  BUNDLE_IN_NINE = { bundle_number: 9, cost: 16.95 }.freeze
  CODE = 'T58'

  def initialize(number_of_item)
    super
    @code = CODE
  end

  private

  def total(combinations)
    total = 0.0
    combinations.each do |number|
      case number
      when BUNDLE_IN_NINE[:bundle_number]
        total += BUNDLE_IN_NINE[:cost]
      when BUNDLE_IN_FIVE[:bundle_number]
        total += BUNDLE_IN_FIVE[:cost]
      when BUNDLE_IN_THREE[:bundle_number]
        total += BUNDLE_IN_THREE[:cost]
      end
    end

    total.round(2)
  end

  def bundles
    [BUNDLE_IN_NINE[:bundle_number], BUNDLE_IN_FIVE[:bundle_number], BUNDLE_IN_THREE[:bundle_number]]
  end

  def get_price(number)
    result = 0
    [BUNDLE_IN_THREE, BUNDLE_IN_FIVE, BUNDLE_IN_NINE].each do |bundle|
      result = bundle[:cost] if bundle[:bundle_number] == number
    end
    result
  end
end
