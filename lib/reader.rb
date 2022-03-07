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
    
  end

  def output
    puts "Created #{output_name} file with #{read_message.length} characters."
  end
end