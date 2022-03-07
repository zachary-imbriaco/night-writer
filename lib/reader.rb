require './lib/dictionary'

class Reader
  attr_reader :file_name :output_name :output_file

  def initialize(file_name)
    @file_name = file_name
    @output_name = output_name
    @output_file = File.new("./data/#{output_name}", "w")
  end
end