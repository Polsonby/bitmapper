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
		case command
		when 'I'
			@bitmapper.create(params[0], params[1])
		when 'C'
			@bitmapper.init_grid
		when 'L'
			@bitmapper.paint(params[0], params[1], params[2])
		when 'H'
			@bitmapper.draw_horizontal(params[0], params[1], params[2], params[3]) 
		when 'V'
			@bitmapper.draw_vertical(params[0], params[1], params[2], params[3]) 
		when 'S'
			puts @bitmapper.show
		when 'X'
			exit
		end
	end

end 

puts "Make bitmaps:"
runner = Runner.new
