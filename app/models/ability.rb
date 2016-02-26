class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    case user.role
    when "super admin"
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
      can :manage, :all
    when "admin"
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
      can :manage, [Image, Comment, Banner, PostType, Feedback, Post]
      can :read, User
      cannot [:destroy, :edit] , User
    when "publisher"
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
      can :read, PostType
      can [:read, :create], Post
      can :update, Post do |post|
        post.user_id == user.id || post.state == "preview"
      end
    when "member"
    end
  end
end
