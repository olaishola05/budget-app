# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    admin_privilege if user.is? :admin
    user_privilege(user) if user.is? :member
    manager_privilege if user.is? :manager
    moderator_privilege if user.is? :moderator

  end

  private

  def user_privilege(user)
    can :read, Category, user_id: user.id
    can :create, Category, user_id: user.id
    can :read, Transact, user_id: user.id
    can :create, Transact, user_id: user.id
  end

  def manager_privilege
    can :manage, [Category, Transact]
  end

  def moderator_privilege
    can :delete, [Category, Transact]
  end

  def admin_privilege
    can :manage, :all
    can :destroy, Category
    can :destroy, Transact
  end
end
