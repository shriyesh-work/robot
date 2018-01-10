require 'minitest/autorun'
require_relative 'robot'
class RobotTest < Minitest::Test 

  def setup
    @robot = Robot.new(2, 4, :NORTH)
  end

  def test_robot_is_placed_at_given_loaction
    assert_equal [2, 4], @robot.get_location
  end

  def test_robot_is_facing_north
    assert_equal :NORTH, @robot.get_direction
  end

  def test_robot_turned_right
    assert_equal :EAST, @robot.turn_right
  end

  def test_robot_turned_left
    assert_equal :WEST, @robot.turn_left
  end

=begin
  def test_robot_has_changed_direction_to_west
    assert_equal :WEST, @robot.change_direction(:WEST)
  end

  def test_robot_has_changed_direction_to_east
    assert_equal :EAST, @robot.change_direction(:EAST)
  end

  def test_direction_is_invalid
    assert Robot.const_defined? @robot.change_direction(:EASTL)
  end
=end
=begin
  def test_robot_has_moved
    expected_location = [1, 4]
    assert_equal expected_location, @robot.move
  end
=end



end