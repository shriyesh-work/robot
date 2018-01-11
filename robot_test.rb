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

  def test_robot_moves_forward 
    assert_equal [2, 3], @robot.move_forward
  end

  def test_robot_moves_back
    @robot.move_forward
    assert_equal [2, 4], @robot.move_back
  end

  def test_robots_adjacent_positions
    adjacent_positions = {left: { x: 1, y: 4}, front: { x: 2, y: 3}, right: { x: 3, y: 4}, back: { x: 2, y: 5}}
    assert_equal adjacent_positions, @robot.get_adjacent_positions
  end

  #def test_robot_move_right
    #assert_equal [3, 4], @robot.move_right 
  #end

end