
require 'singleton'
class PlayersInfo
  include Singleton

  @players_pos = []
  @ids = 0
  def add_player
    @ids += 1
    @players_pos << PlayerInfo::State.new(@ids)
    @ids
  end

  def find_by_id(id)
    @players_pos.detect {|f| f.id = id }
  end
end
