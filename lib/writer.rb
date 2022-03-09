require './lib/night_object'

class Writer < NightObject
  # include Dictionary
  # attr_reader :file_name, :output_file, :output_name
  # def initialize(file_name, output_name)
  #   @file_name = file_name
  #   @output_name = output_name
  #   @output_file = File.open("./data/#{output_name}", "w")
  # end

  # def read_message
  #   message = File.open("./data/#{file_name}", "r")
  #   message.read
  # end

  def message_to_dict
    message = read_message.split('')
    message.map { |character| braille_dict[character.downcase] }
  end

  def dict_to_braille
    message_to_dict.map { |arr| braille = { top: braille_outs[arr[0]], mid: braille_outs[arr[1]], bot: braille_outs[arr[2]] } }
  end

  def braille_to_lines
    lines = ["", "", ""]
    dict_to_braille.map! { |char|
      lines[0] += char[:top]
      lines[1] += char[:mid]
      lines[2] += char[:bot]
      }
    lines
  end

  def line_breaker
    braille_to_lines.map { |line| line.scan(/.{1,80}/) }
  end

  def translate
    line_count = line_breaker[0].length
    line_count.times { |i|
      output_file.puts "#{line_breaker[0][i]}"
      output_file.puts "#{line_breaker[1][i]}"
      output_file.puts "#{line_breaker[2][i]}" }
    output_file.close
  end

  # def char_count
  #   read_message.length
  # end

  # def output
  #   puts "Created '#{output_name}' containing #{char_count} characters."
  # end
end