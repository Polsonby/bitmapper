class Bitmapper
	attr_accessor :grid, :width, :height, :stack

	def initialize()
		create(3,3)
	end

	def show
		@grid
	end

	def create(width, height)
		width = check_dimension(width)
		height = check_dimension(height)

		@width = width
		@height = height
		init_grid
	end

	def init_grid
		@grid = []
		(0..@height - 1).each do |index| 
			grid[index] = "O" * @width
		end
	end

	def paint(x, y, colour)
		x = x.to_i
		y = y.to_i
		colour = colour.to_s[0] if colour
		if check_bounds(x, @width) and check_bounds(y, @height) and colour
			@grid[y - 1][x - 1] = colour
		end
	end

	def draw_horizontal(start_x, end_x, y, colour)
		if check_bounds(start_x, @width) and check_bounds(end_x, @width) and check_bounds(y, @height)
			(start_x..end_x).each do |x| 
				paint(x, y, colour)
			end
		end
	end

	def draw_vertical(x, start_y, end_y, colour)
		if check_bounds(x, @width) and check_bounds(start_y, @height) and check_bounds(end_y, @height)
			(start_y..end_y).each do |y| 
				paint(x, y, colour)
			end
		end
	end

	def fill(x, y, new_colour, target_colour = nil)
		x = x.to_i
		y = y.to_i
		unless target_colour
			@stack = []
			target_colour = get_colour(x, y)
		end		
		@stack = get_neighbours(x, y, @stack, target_colour)
		next_cell = @stack.pop
		paint(x, y, new_colour)
		if next_cell
			fill(next_cell[:x], next_cell[:y], new_colour, @target_colour)
		end
	end

	private

		def check_dimension(val)
			val = val.to_i || 0
			val = 1 if val < 1
			val = 250 if val > 250
			return val
		end

		def check_bounds(val, dimension)
			val = val.to_i 
			val >= 1 and val <= dimension
		end

		def get_colour(x, y)
			@grid[y - 1][x - 1]
		end

		def get_neighbours(x, y, stack, target_colour)
			(y-1..y+1).each do |test_y|
				(x-1..x+1).each do |test_x|
					unless test_x == x and test_y == y
						if check_bounds(test_x, @width) and check_bounds(test_y, @height)
							if get_colour(test_x, test_y) == target_colour
								stack << {x: test_x, y: test_y}
							end
						end
					end
				end
			end
			stack
		end

end