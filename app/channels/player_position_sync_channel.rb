class PlayerPositionSyncChannel < ApplicationCable::Channel
  @player_positions = []

  def subscribed
    p 'subscribed to position sync channel'
  end

  def recieve(data)
    # p "data : "
    p data
    # g = ActiveSupport::JSON.decode(data)
  end
end
