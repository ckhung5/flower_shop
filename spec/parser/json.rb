# frozen_string_literal: true

describe 'parser' do
  let(:expect_result) do
    { 'flowers' => { 'L09' => 15, 'R12' => 10, 'T58' => 13 } }
  end
  it 'should parse the file' do
    expect(JsonParser.data).to eq expect_result
  end
end
