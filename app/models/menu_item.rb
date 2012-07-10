# == Schema Information
#
# Table name: menu_items
#
#  id             :integer         not null, primary key
#  listing_name   :string(255)
#  category_1     :string(255)
#  category_2     :string(255)
#  category_3     :string(255)
#  menu_item_name :string(255)
#  price          :string(255)
#  description    :string(255)
#  add_on_1       :string(255)
#  price_add_on_1 :string(255)
#  add_on_2       :string(255)
#  price_add_on_2 :string(255)
#  notes          :text
#  typist         :string(255)
#  source         :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class MenuItem < ActiveRecord::Base
end
