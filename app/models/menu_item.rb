# == Schema Information
#
# Table name: menu_items
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  listing_name :string(255)
#  description  :string(255)
#  price        :string(255)
#  category1    :string(255)
#  category2    :string(255)
#  category3    :string(255)
#  addOn1       :string(255)
#  addOn1price  :string(255)
#  addOn2       :string(255)
#  addOn2price  :string(255)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  typist       :string(255)
#

class MenuItem < ActiveRecord::Base





end
