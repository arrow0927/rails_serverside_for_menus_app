# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  name                   :string(255)
#

#This class is created by the gem. This represents a user in a generic form. 
#A user can have many roles. These roles are defined and managed by the Roles class
#The roles class is created by the gem Rolify
class User < ActiveRecord::Base
	
	#Method added by the Rolify gem
	rolify
	has_many :assets
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  
  #Every User must have a name and email to use the system, 
  #in addition the email MUST be unique
  validates_presence_of :name, :email
  validates_uniqueness_of  :email, :case_sensitive => false
end
