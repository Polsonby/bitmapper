class Bitmapper
	attr_accessor :grid, :width, :height

	def initialize()
		create(6,8)
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

	def check_dimension(val)
		val = val.to_i || 0
		val = 1 if val < 1
		val = 250 if val > 250
		return val
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

	def check_bounds(val, dimension)
		val = val.to_i 
		val >= 1 and val <= dimension
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
end