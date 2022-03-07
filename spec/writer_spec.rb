require './lib/writer'

RSpec.describe 'Writer' do
  ARGV = ["test_data.txt", "braille.txt"]
  night_writer1 = Writer.new(ARGV[0], ARGV[1])
  ARGV = ["single_letter_test.txt", "single_letter_output.txt"]
  night_writer2 = Writer.new(ARGV[0], ARGV[1])


  it 'outputs a message to CLI' do
    expect(night_writer1.output).not_to eq ''
  end

  it 'reads the provided message file' do
    expect(night_writer1.read_message).to eq 'the quick brown fox jumps over the lazy dog'
  end

  it 'counts the characters in the provided message file' do
    expect(night_writer1.char_count).to eq(43)
  end
end