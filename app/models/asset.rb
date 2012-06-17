# == Schema Information
#
# Table name: assets
#
#  id                         :integer         not null, primary key
#  user_id                    :integer
#  created_at                 :datetime        not null
#  updated_at                 :datetime        not null
#  uploaded_file_file_name    :string(255)
#  uploaded_file_content_type :string(255)
#  uploaded_file_file_size    :integer
#  uploaded_file_updated_at   :datetime
#

class Asset < ActiveRecord::Base
  attr_accessible :user_id, :uploaded_file
  
  belongs_to :user
  #set up "uploaded_file" filed as attached_file(using paperclip)
  has_attached_file :uploaded_file,
                    :path => "assets/:id/:basename.:extension",
                    :storage => :s3,
                    :s3_credentials => "#{:Rails_root}/config/amazon_s3.yml",
                    :bucket => "bmc-app0521-assets"
  
  validates_attachment_size :uploaded_file, :less_than => 1000.megabytes
  validates_attachment_presence :uploaded_file
  
  def file_name
    uploaded_file_file_name
  end
  
  
  
end
