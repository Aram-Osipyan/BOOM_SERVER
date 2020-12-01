class PlayersController <  ApiBaseController
  authorize_resource except: :create
  authenticate_player except: :create
  def create
    @player = Player.create( create_player_params )

    if @player.errors.blank?
      render status: :ok
    else
      render json: @player.errors, status: :bad_request
    end
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
