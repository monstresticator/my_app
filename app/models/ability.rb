class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, User, id: user.id
      can [:create, :destroy], Comment, user_id: user.id
      cannot [:destroy,:update], Product
    end

  end

end

#We begin by defining user permissions with the Ability class. The initialize method takes in a user object as a parameter, so permissions can be modified based on any user attributes.

# In the next line, :manage is the action to the argument can. :manage matches any action on the User controller, meaning any user can manage (perform any action) with a User object. The second parameter is the restriction, meaning that the user must have the same ID as his or her User record does, i.e., the user can manage his or her self.
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

