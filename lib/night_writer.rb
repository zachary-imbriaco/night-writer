require './lib/writer'

night_writer = Writer.new(ARGV[0], ARGV[1])
night_writer.translate
night_writer.output