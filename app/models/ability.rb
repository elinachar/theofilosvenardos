class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all # permissions for every user, even if not logged in
    if user.present?
      can :manage, :all
    end
  end

end
