class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.member?
      can :read, Order
      can :create, Order
      can :read, Product
      can :create, SuggestProduct
    else
      can :read, :all
    end
  end
end
