require './lib/dictionary'

class NightObject
  include Dictionary
  attr_reader :file_name, :output_file, :output_name

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
    # braille_to_lines.map { |line| line.scan(/.{1,80}/) }
  end

  def char_count
    read_message.length
  end

  def translate
    p "Override me!"
  end

  def output
    puts "Created '#{output_name}' containing #{char_count} characters."
  end
end