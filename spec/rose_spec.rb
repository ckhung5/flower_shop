# frozen_string_literal: true

describe 'intialize' do
	it 'should create a rose flower object with 12' do
		expect(Rose.new(12).order_number).to eq 12
		expect(Rose.code_name).to eq 'R12'
	end

	describe '#calculate' do
		context 'order 0 rose' do
			it 'should return the appropriate bill' do
				expect(Rose.new(0).calculate).to eq 0
			end
		end

		context 'order 5 roses' do
			it 'should return the appropriate bill' do
				expect(Rose.new(5).calculate).to eq 6.99
			end
		end

	  context 'order 10 roses' do
			it 'should return the appropriate bill' do
				expect(Rose.new(10).calculate).to eq 12.99
			end
		end

		context 'order 15 roses' do
			it 'should return the appropriate bill' do
				expect(Rose.new(15).calculate).to eq 19.98
			end
		end

		context 'order is not within a bundle' do
			it 'should raise an error' do
				expect(Rose.new(14).calculate).to be_nil
			end
		end
	end
end