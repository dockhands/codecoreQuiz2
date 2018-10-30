class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    alias_action(:create, :read, :update, :delete, to: :crud)
    can(:crud, Idea) do |idea|
      user == idea.user
    end
    can(:crud, Review) do |review|
      user == review.user
    end

  end



end
