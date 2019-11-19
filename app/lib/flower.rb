# frozen_string_literal: true

class Flower
  attr_accessor :order_number
  attr_reader :records, :code_name, :total_bill

  def initialize(order_number)
    @order_number = order_number
    @records = {}
  end

  def calculate
    return 0 if order_number == 0

    combinations = possible_combinations

    return nil if combinations.empty?

    total(combinations)
  end

  def generate_result
    total_bill = calculate
    {
      code_name: code_name,
      order_number: order_number,
      total: "$#{total_bill}",
      records: records_hash
    }
  end

  def code_name
    ''
  end

  private

  def records_hash
    records_hash = []
    records.each do |bundle_number, count|
      records_hash << { flower_per_bundle: bundle_number, bundle_count: count, bundle_per_price: "$#{get_price(bundle_number)}" }
    end
    records_hash
  end

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

  def get_price(_bundle_number)
    nil
  end
end
