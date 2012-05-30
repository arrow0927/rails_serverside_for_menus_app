# == Schema Information
#
# Table name: images
#
#  id                 :integer         not null, primary key
#  image_description  :string(255)
#  image_file_path    :string(255)
#  image_file_size    :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

class Image < ActiveRecord::Base
  
  belongs_to  :listing
  
  has_attached_file :image,
                    :styles => {:thumb =>"75x75>", 
                                :small => "150x150>",
                                :medium => "300x300>"}
end
