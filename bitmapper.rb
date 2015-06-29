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
		@grid[y][x] = colour
	end
end