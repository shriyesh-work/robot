class Robot
  
  NORTH = "north"
  SOUTH = "south"
  EAST = "east"
  WEST = "west"

  RIGHT = {:NORTH => :EAST, :EAST => :SOUTH, :SOUTH => :WEST, :WEST => :NORTH}
  LEFT = {:NORTH => :WEST, :WEST => :SOUTH, :SOUTH => :EAST, :EAST => :NORTH}


  def initialize(x, y, direction)
    @positions = [ {x: x, y: y} ]
    @direction = direction
  end

  def get_adjacent_positions
    current_position = @positions.last
    left = {x: current_position[:x]-1, y: current_position[:y]}
    right = {x: current_position[:x]+1, y: current_position[:y]}
    front = {x: current_position[:x], y: current_position[:y]-1}
    back = {x: current_position[:x], y: current_position[:y]+1}
    @adjacent_positions = {left: left, front: front, right: right, back: back}
  end

  def get_location
    [@positions.last[:x], @positions.last[:y]]
  end

  def get_direction
    @direction
  end

  def turn_right
      @direction = RIGHT[@direction]
  end

  def turn_left
    @direction = LEFT[@direction]
  end

  def move_forward
    current_position = @positions.last
    case @direction
      when :NORTH
        @positions.push({x: current_position[:x], y: current_position[:y]-1})
      when :EAST
        @positions.push({x: current_position[:x]+1, y: current_position[:y]})
      when :SOUTH
        @positions.push({x: current_position[:x], y: current_position[:y]+1})
      when :WEST
        @positions.push({x: current_position[:x]-1, y: current_position[:y]})
    end
    get_location
  end

  def move_back
    current_position_index = @positions.count
    previous_position = @positions[current_position_index-2]
    @positions.push({x: previous_position[:x], y: previous_position[:y]})
    get_location
  end

end