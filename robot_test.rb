require 'minitest/autorun'
require_relative 'robot'
class RobotTest < Minitest::Test 

  def setup
    @robot = Robot.new(2, 4, :NORTH)
  end

  def test_robot_is_placed_at_given_loaction
    expected_position = {x: 2, y: 4}
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
    expected_position = {x: 2, y: 3}
    assert_equal expected_position, @robot.move_forward
  end

  def test_robot_moves_backward
    @robot.move_forward
    expected_position = {x: 2, y: 4}
    assert_equal expected_position, @robot.move_backward
  end

  def test_robots_adjacent_positions
    expected_positions = {front: { x: 2, y: 3}, right: { x: 3, y: 4}, back: { x: 2, y: 5}, left: { x: 1, y: 4}}
    assert_equal expected_positions, @robot.get_adjacent_positions
  end

  def test_robot_moves_left
    expected_position = {x: 1, y: 4}
    assert_equal expected_position, @robot.move_left
  end

  def test_robot_moves_right
    expected_position = {x: 3, y: 4}
    assert_equal expected_position, @robot.move_right
  end

  def test_adjacent_positions_when_turned_right
    @robot.turn_right
    expected_positions = {front: { x: 3, y: 4}, right: { x: 2, y: 5}, back: { x: 1, y: 4}, left: { x: 2, y: 3}}
    assert_equal expected_positions, @robot.get_adjacent_positions
  end

  def test_adjacent_positions_when_turned_left
    @robot.turn_left
    expected_positions = {:front=>{:x=>1, :y=>4}, :right=>{:x=>2, :y=>3}, :back=>{:x=>3, :y=>4}, :left=>{:x=>2, :y=>5}}
    assert_equal expected_positions, @robot.get_adjacent_positions
  end

  def test_robot_position_history
    @robot.move_forward
    @robot.turn_left
    @robot.move_forward
    @robot.move_backward
    @robot.move_left
    expected_positions_history = [{x: 2, y: 4}, {x: 2, y: 3}, {x: 1, y: 3}, {x: 2, y: 3}, {x: 2, y: 4}]
    assert_equal expected_positions_history, @robot.get_position_history
  end

end