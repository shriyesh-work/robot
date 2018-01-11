require 'minitest/autorun'
require_relative 'robot'
class RobotTest < Minitest::Test 

  def setup
    @robot = Robot.new(2, 4, :NORTH)
  end

  def test_robot_is_placed_at_given_loaction
    expected_position = {:x => 2, :y => 4}
    assert_equal expected_position, @robot.get_position
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

  def test_robot_moves_forward 
    expected_position = {:x => 2, :y => 3}
    assert_equal expected_position, @robot.move_forward
  end

  def test_robot_moves_back
    @robot.move_forward
    expected_position = {:x => 2, :y => 4}
    assert_equal expected_position, @robot.move_back
  end

  def test_robots_adjacent_positions
    adjacent_positions = {left: { x: 1, y: 4}, front: { x: 2, y: 3}, right: { x: 3, y: 4}, back: { x: 2, y: 5}}
    assert_equal adjacent_positions, @robot.get_adjacent_positions
  end

  def test_robot_moves_left
    expected_position = {:x => 1, :y => 4}
    assert_equal expected_position, @robot.move_left
  end

  def test_robot_moves_right
    expected_position = {:x => 3, :y => 4}
    assert_equal expected_position, @robot.move_right
  end

end