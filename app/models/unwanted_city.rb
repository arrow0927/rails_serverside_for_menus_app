# == Schema Information
#
# Table name: unwanted_cities
#
#  id                    :integer         not null, primary key
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#  name                  :string(255)
#  telephone             :string(255)
#  fax                   :string(255)
#  suite                 :string(255)
#  address               :string(255)
#  city                  :string(255)
#  province              :string(255)
#  postal_code           :string(255)
#  latitude              :string(255)
#  longitude             :string(255)
#  business_type         :string(255)
#  sub_type              :string(255)
#  owner                 :string(255)
#  source                :string(255)
#  local_area            :string(255)
#  checked               :boolean
#  menu_collected        :boolean
#  menu_digitized        :boolean
#  menu_in_database      :boolean
#  keep                  :boolean
#  get_menu_from_website :boolean
#  notes                 :text
#  menu_state            :string(255)
#  menu_source           :string(255)
#

class UnwantedCity < ActiveRecord::Base
end
