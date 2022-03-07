require './lib/dictionary'

class Reader
  attr_reader :file_name, :output_name, :output_file
  include Dictionary

  def initialize(file_name, output_name)
    @file_name = file_name
    @output_name = output_name
    @output_file = File.open("./data/#{output_name}", "w")
  end

  def read_message
    message = File.open("./data/#{file_name}", "r")
    message.read
  end

  def line_breaker
    read_message.split("\n")
  end

  def char_breaker
    line_breaker.map do |line|
      line.scan(/.{1,2}/)
    end
  end

  def line_grouper
    char_breaker.each_slice(3).to_a
  end

  def pairs_to_hashes
    line_grouper.map do |line|
      arr = []
      line[0].length.times do |i|
        arr << {
          top: line[0][i],
          mid: line[1][i],
          bot: line[2][i]
        }
      end
      arr
    end
  end

  def hashes_to_arrays
    pairs_to_hashes.map do |line|
      line.map do |hash|
        [braille_outs.find_index(hash[:top]), braille_outs.find_index(hash[:mid]), braille_outs.find_index(hash[:bot])]
      end
    end
  end

  def arrays_to_chars
    hashes_to_arrays.map do |line|
      line.map do |arr|
        braille_dict.key(arr)
      end
    end
  end

  def flatten_chars_arrays
    arrays_to_chars.flatten
  end

  def joined_translation
    flatten_chars_arrays.join('')
  end


  def output
    puts "Created #{output_name} file with #{read_message.length} characters."
  end
end