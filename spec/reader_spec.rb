require './lib/reader'

RSpec.describe 'Reader' do
  ARGV = ['braille.txt', 'foxjump.txt']
  night_reader = Reader.new(ARGV[0], ARGV[1])

  it 'outputs a message to CLI' do
    expect(night_reader.output).not_to eq ''
  end

  it 'reads the number of characters in the input file' do
    expect(night_reader.read_message.length).to eq 43 * 6 + 6
  end

  it 'breaks message into individual lines' do
    expect(night_reader.line_breaker.length).to eq 6
  end

  it 'breaks lines into individual character pieces' do
    expect(night_reader.char_breaker[0][0]).to eq ".0"
  end

  it 'sets lines based on top, mid, and bot rows of each braille character' do
    expect(night_reader.line_grouper.length).to eq 2
  end

  it 'turns character piece arrays into hashes with top, mid, and bot keys.' do
    expect(night_reader.pairs_to_hashes[0][0][:top]).to eq ".0"
  end

  it 'turns hashes into arrays of integers based on braille_outs enum' do
    expect(night_reader.hashes_to_arrays[0][0]).to eq [1, 3, 2]
  end

  it 'turns arrays into characters based on key of the associated array in dictionary' do
    expect(night_reader.array_to_char[0][0]).to eq 't'
  end
end