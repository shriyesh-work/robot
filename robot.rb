
class Robot
  attr_reader :direction
  NORTH = "north"
  SOUTH = "south"
  EAST = "east"
  WEST = "west"

  RIGHT = {:NORTH => :EAST, :EAST => :SOUTH, :SOUTH => :WEST, :WEST => :NORTH}
  LEFT = {:NORTH => :WEST, :WEST => :SOUTH, :SOUTH => :EAST, :EAST => :NORTH}

  def initialize(x, y, direction)
    @location = [x,y]
    @direction = direction
  end

  def get_location
    @location
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

  def move
    if @direction.eql? "left"
      @location[0] -= 1
    elsif @direction.eql? "right"
      @location[0] += 1
    end
    @location
  end


end