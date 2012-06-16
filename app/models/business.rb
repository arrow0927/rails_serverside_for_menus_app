# == Schema Information
#
# Table name: businesses
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  address    :string(255)
#  city       :string(255)
#  telephone1 :string(255)
#  url        :string(255)
#  fax        :string(255)
#  telephone2 :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Business < ActiveRecord::Base
  #establish_connection "yplistings_development"
end
