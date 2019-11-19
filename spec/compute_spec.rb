# frozen_string_literal: true

RSpec.describe Compute do
  describe '#calculate_order' do
    context 'given a json file of orders' do
      let(:expected_result) do
        {
          "orders": [
            {
              "code": 'R12',
              "number_of_item": 10,
              "total": '$12.99',
              "records": [
                {
                  "flower_per_bundle": 10,
                  "bundle_count": 1,
                  "bundle_per_price": '$12.99'
                }
              ]
            },
            {
              "code": 'L09',
              "number_of_item": 15,
              "total": '$41.9',
              "records": [
                {
                  "flower_per_bundle": 9,
                  "bundle_count": 1,
                  "bundle_per_price": '$24.95'
                },
                {
                  "flower_per_bundle": 6,
                  "bundle_count": 1,
                  "bundle_per_price": '$16.95'
                }
              ]
            },
            {
              "code": 'T58',
              "number_of_item": 13,
              "total": '$25.85',
              "records": [
                {
                  "flower_per_bundle": 9,
                  "bundle_count": 2,
                  "bundle_per_price": '$16.95'
                },
                {
                  "flower_per_bundle": 3,
                  "bundle_count": 3,
                  "bundle_per_price": '$5.95'
                },
                {
                  "flower_per_bundle": 5,
                  "bundle_count": 2,
                  "bundle_per_price": '$9.95'
                }
              ]
            }
          ]
        }.to_json
      end

      subject do
        described_class.calculate_order
      end
      it 'should return the total of each flower type' do
        expect(subject).to eq expected_result
      end
    end
  end
end
