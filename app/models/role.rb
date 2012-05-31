#This class is created by the gem Rolify
#
class Role < ActiveRecord::Base

  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
end
