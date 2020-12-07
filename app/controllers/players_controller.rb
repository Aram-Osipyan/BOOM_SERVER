class PlayersController <  ApiBaseController
  before_action :authenticate_player, except: :create
  authorize_resource except: :create

  def create
    @player = Player.create( create_player_params )

    if @player.errors.blank?
      render json: @player, status: :ok

    else
      render json: @player.errors, status: :bad_request
    end
  end

  def show
    render json: current_player.to_json(except: %i[password_digest])
  end

  private
  def default_player_fields
    %i[name]
  end

  def create_player_params
    params.required(:player).permit(
        *default_player_fields, :password
    )
  end
end
