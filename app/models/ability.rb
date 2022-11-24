# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    def initialize(current_user)
    return unless current_user.present? # additional permissions for logged in users (they can read their own posts)

    can :manage, Group, user: current_user
    can :manage, Expense, user: current_user
  end
  end
end
