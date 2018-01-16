require "minitest/autorun"

require_relative 'my_robot.rb'

class MyRobotTest < Minitest::Test

  def setup
    @position = Position.new(1,1)
    @direction = Direction::NORTH
    @robot = MyRobot.new(@position, @direction)
  end

  # robot test
  def test_robot_turns_left
    expected_direction = Direction::WEST
    assert_equal expected_direction, @robot.turn_left 
  end

  def test_robot_turns_right
    expected_direction = Direction::EAST
    assert_equal expected_direction, @robot.turn_right
  end

  def test_robot_moves
    expected_position = [1, 2]
    new_position = @robot.move
    assert_equal expected_position, new_position.get_coordinates
  end
 

  # position test
  def test_position_return_above_coordinates
    expected_position = [1, 2]
    above_position = @position.above
    assert_equal expected_position, above_position.get_coordinates
  end

  def test_position_return_below_coordinates
    expected_position = [1, 0]
    below_position = @position.below
    assert_equal expected_position, below_position.get_coordinates
  end

  def test_position_return_left_coordinates
    expected_position = [0, 1]
    left_position = @position.left
    assert_equal expected_position, left_position.get_coordinates
  end

  def test_position_return_right_coordinates
    expected_position = [2, 1]
    above_position = @position.right
    assert_equal expected_position, above_position.get_coordinates
  end

  # north direction test
  def test_direction_north_left
    assert_equal Direction::WEST, Direction::NORTH.left
  end

  def test_direction_north_right
    assert_equal Direction::EAST, Direction::NORTH.right
  end

  def test_direction_north_move
    expected_position = @position.above.get_coordinates
    new_position = Direction::NORTH.move(@position).get_coordinates
    assert_equal expected_position, new_position
  end
  
  # south direction test
  def test_direction_south_left
    assert_equal Direction::EAST, Direction::SOUTH.left
  end

  def test_direction_south_right
    assert_equal Direction::WEST, Direction::SOUTH.right
  end

  def test_direction_south_move
    expected_position = @position.below.get_coordinates
    new_position = Direction::SOUTH.move(@position).get_coordinates
    assert_equal expected_position, new_position
  end

  # east direction test
  def test_direction_east_left
    assert_equal Direction::NORTH, Direction::EAST.left
  end

  def test_direction_east_right
    assert_equal Direction::SOUTH, Direction::EAST.right
  end

  def test_direction_east_move
    expected_position = @position.right.get_coordinates
    new_position = Direction::EAST.move(@position).get_coordinates
    assert_equal expected_position, new_position
  end

  # west direction test
  def test_direction_west_left
    assert_equal Direction::SOUTH, Direction::WEST.left
  end

  def test_direction_west_right
    assert_equal Direction::NORTH, Direction::WEST.right
  end

  def test_direction_west_move
    expected_position = @position.left.get_coordinates
    new_position = Direction::WEST.move(@position).get_coordinates
    assert_equal expected_position, new_position
  end

end