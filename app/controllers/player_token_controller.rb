class PlayerTokenController < Knock::AuthTokenController
  private

  def auth_params
    params.require(:auth).permit(:name, :password)
  end

end
