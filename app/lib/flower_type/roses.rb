# frozen_string_literal: true

class Roses < Flower
  BUNDLE_IN_FIVE = { bundle_number: 5, cost: 6.99 }.freeze
  BUNDLE_IN_TEN = { bundle_number: 10, cost: 12.99 }.freeze
  CODE_NAME = 'R12'

  def code_name
    CODE_NAME
  end

  private

  def total(combinations)
    total = 0.0
    combinations.each do |number|
      case number
      when BUNDLE_IN_FIVE[:bundle_number]
        total += BUNDLE_IN_FIVE[:cost]
      when BUNDLE_IN_TEN[:bundle_number]
        total += BUNDLE_IN_TEN[:cost]
      end
    end

    total.round(2)
  end

  def bundles
    [BUNDLE_IN_TEN[:bundle_number], BUNDLE_IN_FIVE[:bundle_number]]
  end

  def get_price(number)
    result = 0
    [BUNDLE_IN_FIVE, BUNDLE_IN_TEN].each do |bundle|
      result = bundle[:cost] if bundle[:bundle_number] == number
    end
    result
  end
end
