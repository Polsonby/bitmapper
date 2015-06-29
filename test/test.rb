require 'minitest/autorun'
require_relative '../bitmapper'

image = Bitmapper.new
image.create(300,300)
image.paint(1,1,'X')

# image.reset
puts image.width

describe "Grid" do
	it "should default to 6 by 8" do 
		grid = Bitmapper.new
		grid.show.must_equal ["OOOOOO", "OOOOOO", "OOOOOO", "OOOOOO", "OOOOOO", "OOOOOO", "OOOOOO", "OOOOOO"]
	end
	it "should be the right size if you call create" do
		grid = Bitmapper.new
		grid.create(4,4)
		grid.show.must_equal ["OOOO", "OOOO", "OOOO", "OOOO"]
	end
	it "should not let you make it too big" do 
		grid = Bitmapper.new
		grid.create(300, -3)
		grid.width.must_equal 250
		grid.height.must_equal 1
	end
	it "should cope with strings for dimensions" do
		grid = Bitmapper.new
		grid.create('fish', 'bicycle')
		grid.width.must_equal 1
		grid.height.must_equal 1
		grid.show.must_equal ["O"]
	end
	it "should let you paint pixels" do 
		grid = Bitmapper.new
		grid.create(3,3)
		grid.paint(1,1,'X')
		grid.show.must_equal ["OOO", "OXO", "OOO"]
	end
end

# describe "Person" do 
#    it "has a name" do
#    	 person = Person.new('Ian', 'Anderson')
#    	 person.fullname.must_equal 'Ian Anderson'
#    end
# end
