# class definition
class PlayerPositionSyncChannel < ApplicationCable::Channel
  before_subscribe :init_redis

  def subscribed
    p 'subscribed to position sync channel'
    stream_from 'some'
    # curr_id = PlayersInfo.add_player
    SendPlayersPosJob.perform_now unless SendPlayersPosJob.perform?
  end

  # current_user.id
  def recieve(data)
    # p "data : "
    p data
    value = ActiveSupport::JSON.encode ({id: current_user.id, position:  data['position']})
    @redis.set("pl#{current_user.id}", value )
    # ActionCable.server.broadcast 'some', id: current_user.id, name: current_user.name
    # g = ActiveSupport::JSON.decode(data)
    # ActionCable.server.broadcast 'some', data

  end

  def unsubscribed
    SendPlayersPosJob.stop_perfom
  end

  private

  def init_redis
    @redis = Redis.new(host: '127.0.0.1', port: 6379, db: 15)
    @redis.set('player_positions', []) if @redis.get('player_positions').nil?
  end


end
