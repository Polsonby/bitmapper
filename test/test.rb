require 'minitest/autorun'
require_relative '../bitmapper'

describe "Grid" do

	before do 
		@grid = Bitmapper.new
	end 

	it "should default to 3 by 3" do 
		@grid.show.must_equal ["OOO", "OOO", "OOO"]
	end
	it "should be the right size if you call create" do
		@grid.create(4,4)
		@grid.show.must_equal ["OOOO", "OOOO", "OOOO", "OOOO"]
	end
	it "should not let you make it too big" do 
		@grid.create(300, -3)
		@grid.width.must_equal 250
		@grid.height.must_equal 1
	end
	it "should cope with strings for dimensions" do
		@grid.create('fish', 'bicycle')
		@grid.width.must_equal 1
		@grid.height.must_equal 1
		@grid.show.must_equal ["O"]
	end
	it "should let you paint pixels" do 
		@grid.paint(2,2,'X')
		@grid.show.must_equal ["OOO", "OXO", "OOO"]
	end
	it "should not let you paint off the grid" do
		@grid.paint(4,4,'X')
		@grid.show.must_equal ["OOO", "OOO", "OOO"]		
	end
	it "should let you use strings for numbers" do 
		@grid.create("3","3")
		@grid.paint("2","2",'X')
		@grid.show.must_equal ["OOO", "OXO", "OOO"]		
	end
	it "should cope if you use words for colours" do 
		@grid.create(3, 3)
		@grid.paint("2","2",'GREEN')
		@grid.show.must_equal ["OOO", "OGO", "OOO"]		
	end
	it "should let you draw rows" do 
		@grid.draw_horizontal(1, 3, 1, "X")
		@grid.show.must_equal ["XXX", "OOO", "OOO"]
	end
	it "should let you draw columns" do 
		@grid.draw_vertical(1, 1, 3, "X")
		@grid.show.must_equal ["XOO", "XOO", "XOO"]
	end
	it "should not let you draw columns or rows off the grid" do 
		@grid.draw_horizontal(-1, 4, 1, "X")
		@grid.draw_vertical(1, -3, 4, "X")
		@grid.show.must_equal ["OOO", "OOO", "OOO"]		
	end
	it "should ignore the command if the row or column is drawn backwards" do
		@grid.draw_horizontal(3, 1, 1, "X")
		@grid.draw_vertical(1, 3, 1, "X")		
		@grid.show.must_equal ["OOO", "OOO", "OOO"]
	end
	it "should fill cells that are the same colour" do 
		@grid.fill("1", "1", "X")
		@grid.show.must_equal ["XXX", "XXX", "XXX"]
	end
end

