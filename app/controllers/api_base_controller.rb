class  ApiBaseController < ActionController::API
  include Knock::Authenticable
  def current_ability
    @current_ability ||= Ability.new(current_player)
  end
end
