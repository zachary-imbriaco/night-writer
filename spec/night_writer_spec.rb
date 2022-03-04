require './lib/night_writer'

RSpec.describe 'Night Writer' do
  ARGV[0] = "./data/test_data.txt"
  night_writer = NightWriter.new(ARGV[0])

  it 'outputs a message to CLI' do
    expect(night_writer.output).not_to eq ''
  end

  it 'reads the provided message file' do
    expect(night_writer.read_message).to eq 'the quick brown fox jumps over the lazy dog'

  end
end