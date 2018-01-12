class Plateau
  attr_accessor :dimension_x, :dimension_y
  def initialize(dimension_x, dimension_y)
    @dimension_x = dimension_x
    @dimension_y = dimension_y
  end 
end

class Coordinate
  attr_accessor :x, :y, :instruction
  def initialize(x = 0, y = 0, instruction = nil)
    @x = x
    @y = y
    @instruction = instruction
  end
end

class Robot
  attr_accessor :direction, :positions, :adjacent_positions
  NORTH = "north"
  SOUTH = "south"
  EAST = "east"
  WEST = "west"

  RIGHT = {:NORTH => :EAST, :EAST => :SOUTH, :SOUTH => :WEST, :WEST => :NORTH}
  LEFT = {:NORTH => :WEST, :WEST => :SOUTH, :SOUTH => :EAST, :EAST => :NORTH}

  def initialize(x = 0, y = 0, direction = :NORTH)
    @positions = [ Coordinate.new(x, y) ]
    @direction = direction
    @plateau = nil
    calculate_adjacent_positions
  end

  def calculate_adjacent_positions
    current_position = @positions.last
    case @direction
    when :NORTH 
      front = {x: current_position.x, y: current_position.y-1}
      back = {x: current_position.x, y: current_position.y+1}
      left = {x: current_position.x-1, y: current_position.y}
      right = {x: current_position.x+1, y: current_position.y} 
    when :EAST
      front = {x: current_position.x+1, y: current_position.y}
      back = {x: current_position.x-1, y: current_position.y}
      left = {x: current_position.x, y: current_position.y-1}
      right = {x: current_position.x, y: current_position.y+1} 
    when :SOUTH
      front = {x: current_position.x, y: current_position.y+1}
      back = {x: current_position.x, y: current_position.y-1}
      left = {x: current_position.x+1, y: current_position.y}
      right = {x: current_position.x-1, y: current_position.y} 
    when :WEST
      front = {x: current_position.x-1, y: current_position.y}
      back = {x: current_position.x+1, y: current_position.y}
      left = {x: current_position.x, y: current_position.y+1}
      right = {x: current_position.x, y: current_position.y-1} 
    end
    @adjacent_positions = {front: front, right: right, back: back, left: left}
  end

  def get_position
    { x: @positions.last.x, y: @positions.last.y }
  end

  def get_adjacent_positions
    @adjacent_positions
  end

  def get_direction
    @direction
  end

  def turn_right
    @direction = RIGHT[@direction]
    calculate_adjacent_positions
    new_position = Coordinate.new(@positions.last.x, @positions.last.y, "turn_right")
    @positions.push(new_position)
    @direction
  end


  def turn_left
    @direction = LEFT[@direction]
    calculate_adjacent_positions
    new_position = Coordinate.new(@positions.last.x, @positions.last.y, "turn_left")
    @positions.push(new_position)
    @direction
  end

  def move_forward
    new_position = Coordinate.new(@adjacent_positions[:front][:x], @adjacent_positions[:front][:y], "move_forward")
    @positions.push(new_position)
    calculate_adjacent_positions
    get_position
  end

  def move_backward
    new_position = Coordinate.new(@adjacent_positions[:back][:x], @adjacent_positions[:back][:y], "move_backward")
    @positions.push(new_position)
    calculate_adjacent_positions
    get_position
  end

  def move_left
    new_position = Coordinate.new(@adjacent_positions[:left][:x], @adjacent_positions[:left][:y], "move_left")
    @positions.push(new_position)
    calculate_adjacent_positions
    get_position
  end

  def move_right
    new_position = Coordinate.new(@adjacent_positions[:right][:x], @adjacent_positions[:right][:y], "move_right")
    @positions.push(new_position)
    calculate_adjacent_positions
    get_position
  end

  def get_position_history
    positions = []
    @positions.each do |coordinate|
      positions.push({x: coordinate.x, y: coordinate.y, instruction: coordinate.instruction})
    end
    positions
  end

  def turn_back
    turn_left
    turn_left
    @direction
  end

  def has_plateau?
    @plateau.nil? ? false : true
  end

  def place_robot(plateau)
    @plateau = plateau
  end

  def exceed_plateau(x, y)
    if has_plateau?
      if x > @plateau.dimension_x || y > @plateau.dimension_y
        true
      elsif x < 0 || y < 0
        true
      else
        false
      end
    else
      true
    end
  end
    
  #     if x > @plateau.dimension_x || y > @plateau.dimension_y 
  #       true
  #     elsif x < @plateau.dimension_x || y < @plateau.dimension_y
  #       true
  #     else
  #       false
  #     end
    
    
  # end
=begin
=end
end