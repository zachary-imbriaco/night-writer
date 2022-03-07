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
  def translate

  end

  def char_count
    read_message.length
  end

  def output
    print "Created '#{output_name}' containing #{char_count} characters."
  end
end