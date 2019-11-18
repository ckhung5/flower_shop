# frozen_string_literal: true

describe 'intialize' do
	it 'should create a tulip flower object with 12' do
		expect(Tulips.new(12).order_number).to eq 12
		expect(Tulips.new(12).code_name).to eq 'T58'
	end

	describe '#calculate' do
		context 'order 0 tulip' do
			it 'should return the appropriate bill' do
				expect(Tulips.new(0).calculate).to eq 0
			end
		end

		context 'order 3 tulips' do
			it 'should return the appropriate bill' do
				expect(Tulips.new(3).calculate).to eq 5.95
			end
		end

	  context 'order 13 tulips' do
			it 'should return the appropriate bill' do
				expect(Tulips.new(13).calculate).to eq 25.85
			end
		end

		context 'order is not within a bundle' do
			it 'should raise an error' do
				expect(Tulips.new(1).calculate).to be_nil
			end
		end
	end
end