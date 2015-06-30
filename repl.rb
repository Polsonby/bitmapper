require_relative 'bitmapper'

class Runner
	attr_reader :bitmapper
	
	def initialize
		@bitmapper = Bitmapper.new

		loop do
		  print "> "
		  handle_input(gets.chomp!)
		end
	end 

	def handle_input(input)
		command, *params = input.split /\s/
		@bitmapper.create(params[0], params[1]) if command == 'I'
		@bitmapper.init_grid if command == 'C'
		@bitmapper.paint(params[0], params[1], params[2]) if command == 'L'
		@bitmapper.draw_horizontal(params[0], params[1], params[2], params[3]) if command == 'H'
		@bitmapper.draw_vertical(params[0], params[1], params[2], params[3]) if command == 'V'
		puts @bitmapper.show if command == 'S'
		exit if command == 'X'
	end

end 

puts "Make bitmaps:"
runner = Runner.new
