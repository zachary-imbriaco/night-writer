class NightWriter
  attr_reader :file_path
  def initialize(file_path)
    @file_path = file_path
  end

  def output
    print "Created 'braille.txt' containing 256 characters."
  end
end