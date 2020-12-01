class Ability
  include CanCan::Ability

  def initialize(player)
    player ||= Player.new
    if player&.class == Player
      can :manage, Player, id: player.id
    end
  end
end
