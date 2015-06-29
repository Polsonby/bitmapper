class Bitmapper
	attr_accessor :grid, :width, :height

	def initialize()
		create(6,8)
	end

	def show
		@grid
	end

	def create(width, height)
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
end