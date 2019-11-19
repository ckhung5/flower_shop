# frozen_string_literal: true

RSpec.describe Lilies do
	describe '#initialize' do
		it 'should create a lily flower object with 12' do
			expect(described_class.new(12).order_number).to eq 12
			expect(described_class.new(12).code_name).to eq 'L09'
		end

		describe '#calculate' do
			context 'order 0 lily' do
				it 'should return the appropriate bill' do
					expect(described_class.new(0).calculate).to eq 0
				end
			end

			context 'order 3 lilies' do
				it 'should return the appropriate bill' do
					expect(described_class.new(3).calculate).to eq 9.95
				end
			end

		  context 'order 15 lilies' do
				it 'should return the appropriate bill' do
					expect(described_class.new(15).calculate).to eq 41.90
				end
			end

			context 'order is not within a bundle' do
				it 'should raise an error' do
					expect(described_class.new(1).calculate).to be_nil
				end
			end
		end
	end
end