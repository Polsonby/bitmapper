require 'minitest/autorun'
require_relative '../bitmapper'

image = Bitmapper.new
# image.create(4,4)
# image.reset
puts image.show
# puts image.grid

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
end

# describe "Person" do 
#    it "has a name" do
#    	 person = Person.new('Ian', 'Anderson')
#    	 person.fullname.must_equal 'Ian Anderson'
#    end
# end
