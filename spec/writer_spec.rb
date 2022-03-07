require './lib/writer'

RSpec.describe 'Writer' do
  ARGV = ["test_data.txt", "braille.txt"]
  night_writer1 = Writer.new(ARGV[0], ARGV[1])

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
    expect(night_writer1.dict_to_braille.length).to eq 43
  end

  it 'translates braille strings into line strings' do
    expect(night_writer1.braille_to_lines.length).to eq 3
    expect(night_writer1.braille_to_lines[0].length).to eq 86
  end

  it 'breaks up strings correctly based on total characters' do
    expect(night_writer1.line_breaker[0].length).to eq 2
    expect(night_writer2.line_breaker[0].length).to eq 1
  end

  it 'translates english statements to braille' do
    night_writer1.translate
    output = File.open('./data/braille.txt', "r")
    expected = File.open('./data/braille_output_checker.txt', "r")

    expect(output.read).to eq expected.read
  end

end