# frozen_string_literal: true

RSpec.describe JsonParser do
  describe 'parser' do
    let(:expect_result) do
      { 'flowers' => { 'L09' => 15, 'R12' => 10, 'T58' => 13 } }
    end

    it 'should parse the file' do
      expect(described_class.parse).to eq expect_result
    end

    context 'error format' do
    	it 'should raise error' do
    		allow(File).to receive(:open).and_raise("format error")
    		expect{described_class.parse}.to raise_error("format error")
    	end
    end
  end
end
