require "minitest/autorun"

require_relative 'my_robot.rb'

class MyRobotTest < Minitest::Test

  def setup
    @position = Position.new(1,1)
    @direction = Direction::NORTH
    @robot = MyRobot.new(@position, @direction)
  end

  def test_robot_turns_left
    expected_direction = Direction::WEST
    assert expected_direction == @robot.turn_left 
  end

  def test_robot_turns_right
    expected_direction = Direction::EAST
    assert expected_direction == @robot.turn_right
  end

  def test_robot_move
    expected_position = Position.new(1,2)
    puts expected_position #== @robot.move
  end
end