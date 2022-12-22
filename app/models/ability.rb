class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Group, user: user
    can :manage, Charge, user: user
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
  end
end
