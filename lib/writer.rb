require './lib/dictionary'

class Writer
  include Dictionary
  attr_reader :file_name, :output_name
  def initialize(file_name, output_name)
    @file_name = file_name
    @output_name = output_name
  end

  def read_message
    message = File.open('./data/' + file_name, "r")
    message.read
  end

  def message_to_dict
    message = read_message.split('')
    message.map do |character|
      braille_dict[character.downcase]
    end
  end

  def dict_to_braille
    message_to_dict.map do |arr|
      braille = { 
        top: braille_outs[arr[0]],
        mid: braille_outs[arr[1]],
        bot: braille_outs[arr[2]] 
      }
    end
  end

  def braille_to_lines
    lines = ["", "", ""]
    dict_to_braille.each do |char|
      lines[0] += char[:top]
      lines[1] += char[:mid]
      lines[2] += char[:bot]
    end
    lines
  end

  def translate

  end

  def char_count
    read_message.length
  end

  def output
    print "Created '#{output_name}' containing #{char_count} characters."
  end
end