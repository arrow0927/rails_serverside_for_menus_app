# == Schema Information
#
# Table name: listings
#
#  id                    :integer         not null, primary key
#  name                  :string(255)     default("Not Available")
#  telephone             :string(255)     default("Not Available")
#  fax                   :string(255)     default("Not Available")
#  suite                 :string(255)     default("Not Available")
#  address               :string(255)     default("Not Available")
#  city                  :string(255)     default("Not Available")
#  province              :string(255)     default("Not Available")
#  postal_code           :string(255)     default("Not Available")
#  latitude              :string(255)     default("Not Available")
#  longitude             :string(255)     default("Not Available")
#  business_type         :string(255)     default("Not Available")
#  sub_type              :string(255)     default("Not Available")
#  owner                 :string(255)     default("Not Available")
#  source                :string(255)     default("Not Available")
#  local_area            :string(255)     default("Not Available")
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#  checked               :boolean
#  menu_collected        :boolean
#  menu_digitized        :boolean
#  menu_in_database      :boolean
#  keep                  :boolean         default(TRUE)
#  get_menu_from_website :boolean         default(TRUE)
#  notes                 :text
#  menu_state            :string(255)
#  menu_source           :string(255)
#

class Listing < ActiveRecord::Base
  
  has_many :images
  #NON DATATABLES VERSION uses this===============
  
  #def self.search(search)
   # if search
    #  where(['name LIKE ?', "%#{search}"])
    #else
     # scoped
   
    #end
  
#end


=begin
  has_attached_file :image,
                    :styles =>
                    {
                      :thumb => "75x75>", :small => "150x150>", 
                      :medium => "300x300>"
                    }
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
=end

end
