class MyRobot
  def initialize position, direction
    @position = position
    @direction = direction    
  end

  def turn_left
    @direction = @direction.left
  end

  def turn_right
    @direction = @direction.right
  end

  def move
    @position = @direction.move(@position)
  end

  # def to_s
  #   "#{@position} --- #{@direction}"
  # end
end

class Position
  def initialize(x, y)
    @x = x
    @y = y
  end

  def above
    Position.new(@x, @y+1)
  end

  def left
    Position.new(@x-1, @y)
  end

  def below
    Position.new(@x, @y-1)
  end

  def right
    Position.new(@x+1,@y)
  end

  def get_coordinates
    [@x, @y]
  end

end

module Direction

  class North
    def left
      WEST
    end

    def right
      EAST
    end

    def move current_postition
      current_postition.above
    end

  end

  class South
    def left
      EAST
    end

    def right
      WEST
    end

    def move current_postition
      current_postition.below
    end
  end

  class East
    def left
      NORTH
    end

    def right
      SOUTH
    end

    def move current_postition
      current_postition.right
    end
  end

  class West
    def left
      SOUTH
    end

    def right
      NORTH
    end

    def move current_postition
      current_postition.left
    end

  end

  NORTH = North.new
  SOUTH = South.new
  EAST = East.new
  WEST = West.new
end

# my_robot = MyRobot.new(Position.new(1,1), Direction::NORTH)
# my_robot.turn_left
# my_robot.move
# puts my_robot