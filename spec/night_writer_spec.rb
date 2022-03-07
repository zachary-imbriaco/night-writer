require './lib/writer'

RSpec.describe 'Night Writer' do
  ARGV = ["test_data.txt", "braille.txt"]
  night_writer = NightWriter.new(ARGV[0], ARGV[1])

  it 'outputs a message to CLI' do
    expect(night_writer.output).not_to eq ''
  end

  it 'reads the provided message file' do
    expect(night_writer.read_message).to eq 'the quick brown fox jumps over the lazy dog'
  end

  it 'counts the characters in the provided message file' do
    expect(night_writer.char_count).to eq(43)
  end
end