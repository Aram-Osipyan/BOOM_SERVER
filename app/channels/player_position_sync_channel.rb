# class definition
class PlayerPositionSyncChannel < ApplicationCable::Channel
  def subscribed
    p 'subscribed to position sync channel'
    stream_from 'some'
    # curr_id = PlayersInfo.add_player

  end

  def recieve(data)
    # p "data : "
    p data
    ActionCable.server.broadcast 'some', id: 1
    # g = ActiveSupport::JSON.decode(data)
    # ActionCable.server.broadcast 'some', data

  end

  private

  def met
    while true
      sleep(0.1)
    end
  end
end
