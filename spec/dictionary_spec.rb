require './lib/dictionary'
require './lib/writer'

RSpec.describe 'Dictionary' do
  writer = Writer.new("test_data.txt", "braille.txt")

  it 'contains a dictionary of lowercase braille letters and space' do
    expect(writer.dictionary.length).to eq 27
  end

  it 'contains an array of possible braille outputs' do
    expect(writer.braille[3]).to eq "00"
  end
end