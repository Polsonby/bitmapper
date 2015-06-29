bitmapper

key moving parts

1. A console style REPL
2. A class which contains the grid and the methods for manipulating it. Should the grid be separate from the methods to manipulate it? Nah probably not. 
3. Use libraries to assist with input/output?

So 

@grid = Grid.new(8,8) #initialize calls create
@grid.create(width, height) #creates a new grid with white cells
@grid.reset #clears all the cells and fills white
@grid.paint(x, y, colour) #paints the cell 3,4
@grid.draw_horizontal(row, start_x, end_x, colour)
@grid.draw_vertical(col, start_y, end_y, colour)
@grid.fill(x, y, colour) # fills all contiguous cells with the original colour of x,y with colour.
@grid.show #outputs the grid

