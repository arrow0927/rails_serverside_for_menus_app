# == Schema Information
#
# Table name: businesses
#
#  name       :text
#  address    :text
#  city       :text
#  telephone1 :text
#  url        :text
#  fax        :text
#  telephone2 :text
#

class Business < ActiveRecord::Base
  #establish_connection "yplistings_development"
end
