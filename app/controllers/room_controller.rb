class RoomController < ApiBaseController
  before_action :init_redis
  # authorize_resource except: :create
  # room states:
  # created
  # play
  def create
    @redis.set("room#{article_params[:id]}",'created')
    @redis.set "player_room#{article_params[:id]}", "room#{article_params[:id]}"
    rooms = @redis.keys('room[0-9]*').filter { |room| @redis.get(room) == 'created' }
    render json: rooms.to_json
  end

  def show
    rooms = @redis.keys('room[0-9]*').filter { |room| @redis.get(room) == 'created' }
    render json: rooms.to_json
  end

  def subscribe_to_room
    if @redis.get(room_subscribe_params[:id]).nil?
      render status: :internal_server_error
    else
      @redis.set "player_room#{room_subscribe_params[:player]}", room_subscribe_params[:id]
      render status: :ok
    end
  end

  private

  def article_params
    params.require(:player).permit(:id)
  end

  def room_subscribe_params
    params.require(:room).permit(:player, :id)
  end

  def init_redis
    @redis = Redis.new(host: '127.0.0.1', port: 6379, db: 15)

  end
end
