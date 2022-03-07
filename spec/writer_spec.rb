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

  it 'translates text to braille dict' do
    expect(night_writer1.message_to_dict.length).to eq 43
    expect(night_writer1.message_to_dict[0]).to eq [1, 3, 2]
  end

  it 'translates braille dict to braille strings' do
    expect(night_writer1.dict_to_braille.length).to eq [3]
  end

  it 'translates single letter of english to braille' do
    night_writer2.translate
    
    output = File.open("./data/single_letter_output.txt", "r")
    expect(output.read).to eq "0....."
  end
end