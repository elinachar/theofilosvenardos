class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.present?
      can [:show, :update, :destroy], User, id: user.id
      if user.admin?
        can :manage, :all
      end
    end
  end

end
