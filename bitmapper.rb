class Bitmapper
	attr_accessor :grid, :width, :height

	def initialize()
		create(6,8)
	end

	def show
		@grid
	end

	def create(width, height)
		width = width.to_i || 0
		height = height.to_i || 0
		width = 1 if width < 1
		height = 1 if height < 1
		width = 250 if width > 250
		height = 250 if height > 250

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
		if x >= 1 and x <= @width and y >= 1 and y <= @height
			@grid[y - 1][x - 1] = colour
		end
	end

	def draw_horizontal(start_x, end_x, y, colour)
		if start_x >=1 and start_x <= @width and end_x >=1 and end_x <= @width and y >= 1 and y <= @height
			(start_x..end_x).each do |x| 
				paint(x, y, colour)
			end
		end
	end

	def draw_vertical(x, start_y, end_y, colour)
		if x >= 1 and x <= @width and start_y >=1 and start_y <= @height and end_y >=1 and end_y <= @height
			(start_y..end_y).each do |y| 
				paint(x, y, colour)
			end
		end
	end
end