class RoomController < ApplicationController
  before_action :init_redis
  skip_before_action :verify_authenticity_token
  # room states:
  # created
  # play
  def create
    @redis.set("player_room#{article_params[:id]}",'created')
    rooms = @redis.keys('player_room[0-9]*').filter { |room| @redis.get(room) == 'created' }
    render json: rooms.to_json
  end

  def show
    rooms = @redis.keys('player_room[0-9]*').filter { |room| @redis.get(room) == 'created' }
    render json: rooms.to_json
  end

  private

  def article_params
    params.require(:player).permit(:id)
  end

  def init_redis
    @redis = Redis.new(host: '127.0.0.1', port: 6379, db: 15)

  end
end
