require './lib/reader'

night_reader = Reader.new(ARGV[0], ARGV[1])
night_reader.translate
night_reader.output