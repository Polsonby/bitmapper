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
		when 'I', 'i'
			@bitmapper.create(params[0], params[1])
		when 'C', 'c'
			@bitmapper.init_grid
		when 'L', 'l'
			@bitmapper.paint(params[0], params[1], params[2])
		when 'H', 'h'
			@bitmapper.draw_horizontal(params[0], params[1], params[2], params[3]) 
		when 'V', 'v'
			@bitmapper.draw_vertical(params[0], params[1], params[2], params[3]) 
		when 'F', 'f'
			@bitmapper.fill(params[0], params[1], params[2])
		when 'S', 's'
			puts @bitmapper.show
		when 'X', 'x'
			exit
		end
	end

end 

puts "Make bitmaps:"
runner = Runner.new
