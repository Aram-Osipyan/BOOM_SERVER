module PlayerInfo
  # class for storing player pos
  class Position
    def initialize(x,y,z)
      @x = x
      @y = y
      @z = z
    end
  end

  # class for storing player state
  class State
    @position = Position.new(0,0,0)
    def write_pos(player_pos )
      if player_pos.class != Position
        return
      end

      @position.x = player_pos.x
      @position.y = player_pos.y
      @position.z = player_pos.z
    end
  end

end
