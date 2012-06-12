# == Schema Information
#
# Table name: addresses
#
#  id            :integer         not null, primary key
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  business_name :string(255)
#  address       :string(255)
#  telephone_1   :string(255)
#  url           :string(255)
#  fax           :string(255)
#  telephone_2   :string(255)
#  city          :string(255)
#

class Address < ActiveRecord::Base
  
end
