require 'minitest/autorun'

class CoordinateTest < Minitest::Test 

  def setup
    @coordinate = Coordinate.new(2,2)
  end

  def test_coordinates_return_above_coordinates
    @expected_coordinate = @coordinate.above
    assert_equal @expected_coordinate
end