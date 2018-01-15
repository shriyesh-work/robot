require 'minitest/autorun'
require_relative 'robot'
class RobotTest < Minitest::Test 

  def setup
    @robot = Robot.new(2, 4, :NORTH)
    @plateau = Plateau.new(5, 5)
    @robot.place_robot(@plateau)
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

  def test_robots_adjacent_positions_when_facing_north
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
    expected_positions_history = [{x: 2, y: 4, instruction: nil }, {x: 2, y: 3, instruction: "move_forward"}, {x: 2, y: 3, instruction: "turn_left"}, {x: 1, y: 3, instruction: "move_forward"}, {x: 2, y: 3, instruction: "move_backward"}, {x: 2, y: 4, instruction: "move_left"}]
    assert_equal expected_positions_history, @robot.get_position_history
  end

  def test_robot_turns_back
    assert_equal :SOUTH, @robot.turn_back 
  end

  def test_robots_adjacent_positions_when_facing_south
    @robot.turn_back
    expected_positions = {front: { x: 2, y: 5}, right: { x: 1, y: 4}, back: { x: 2, y: 3}, left: { x: 3, y: 4}}
    assert_equal expected_positions, @robot.get_adjacent_positions
  end

  def test_robots_adjacent_positions_when_facing_east
    @robot.turn_right
    expected_positions = {left: { x: 2, y: 3}, front: { x: 3, y: 4}, right: { x: 2, y: 5}, back: { x: 1, y: 4}}
    assert_equal expected_positions, @robot.get_adjacent_positions
  end

  def test_robots_adjacent_positions_when_facing_west
    @robot.turn_left
    expected_positions = {right: { x: 2, y: 3}, back: { x: 3, y: 4}, left: { x: 2, y: 5}, front: { x: 1, y: 4}}
    assert_equal expected_positions, @robot.get_adjacent_positions
  end

  # def test_robot_does_not_have_a_plateau
  #   refute @robot.has_plateau? 
  # end

  def test_robot_is_placed_on_plateau
    assert @robot.place_robot(@plateau)
  end

  def test_robot_has_a_plateau
    assert @robot.has_plateau? 
  end

  def test_robot_exceeds_plateau_x_dimension
    assert_equal true, @robot.exceed_plateau(6,4)
  end

  def test_robot_exceeds_plateau_y_dimension
    assert_equal true, @robot.exceed_plateau(2,6)
  end

  def test_robot_exceeds_plateau_x_and_y_dimension
    assert_equal true, @robot.exceed_plateau(6,6)
  end

  def test_robot_preceeds_plateau_x_dimension
    assert_equal true, @robot.exceed_plateau(-6,4)
  end

  def test_robot_preceeds_plateau_y_dimension
    assert_equal true, @robot.exceed_plateau(2,-6)
  end

  def test_robot_preceeds_plateau_x_and_y_dimension
    assert_equal true, @robot.exceed_plateau(-6,-6)
  end

  def test_robot_doesnt_exceed_plateau_dimensions
    assert_equal false, @robot.exceed_plateau(2,4)
  end

  def test_robot_cannot_move_forward_without_plateau
    @robot.place_robot(nil)
    assert_equal "There is no plateau, couldnt move!", @robot.move_forward
  end

  def test_robot_cannot_move_backward_without_plateau
    @robot.place_robot(nil)
    assert_equal "There is no plateau, couldnt move!", @robot.move_backward 
  end

  def test_robot_cannot_move_left_without_plateau
    @robot.place_robot(nil)
    assert_equal "There is no plateau, couldnt move!", @robot.move_left
  end

  def test_robot_cannot_move_right_without_plateau
    @robot.place_robot(nil)
    assert_equal "There is no plateau, couldnt move!", @robot.move_right
  end

  def test_robot_executes_given_commands
    expected_commands = "MFTLMF" #MC is invalid command
    assert_equal expected_commands, @robot.execute("MFTLMFMCML")
  end

end