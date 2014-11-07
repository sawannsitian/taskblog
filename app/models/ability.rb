class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.role == "Manager"
      can :manage, :all
    elsif user.role == "Data Collection Exec"
      can :read, Tasklist
      can :create, Comment
      can :edit, Tasklist
    elsif user.role == "Customer Service Exec"
      can :read, Tasklist
      can :create, Tasklist
      can :edit, Tasklist
    end
  end
end
