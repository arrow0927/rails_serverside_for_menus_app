class Ability
  include CanCan::Ability
#This class is added to the project when the CanCan gem is installed. 
#Its the central location where all the permissiona are managed from
#CanCan is used in conjunction with Devise and Rolify for authentication and authorization system.
#The user Class is associated with Devise.   


  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    end

    if user.has_role? :typist
      can :read, :S3File
    end


   
  end





end
