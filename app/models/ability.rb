class Ability
  include CanCan::Ability

    def initialize(user)
            user ||= User.new
            if user.role? :admin
                can :manage, :all
            elsif user.persisted?
                can :read, :all
                can :create, Restaurant
                can :create, Burger
                can :create, Rating
                can :update, Burger, user_id: user.id
                can :destroy, Burger, user_id: user.id
                can :destroy, Restaurant, user_id: user.id  
            else

            end
    
    end
end
