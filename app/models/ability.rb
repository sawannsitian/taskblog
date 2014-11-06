class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.role == "Manager"
      can :manage, :all
    elsif user.role == "Data Collection Exec"
      can :read, Tasklist
      can :create, Comment
    elsif user.role == "Customer Service Exec"
      can :read, Tasklist
      can :create, Tasklist
    end
  end
end
