require './lib/night_writer'

RSpec.describe 'Night Writer' do
  night_writer = NightWriter.new('./data/test_data.txt')
  it 'Night Writer returns a message to CLI' do
    expect(night_writer.output).not_to eq ''
  end
end