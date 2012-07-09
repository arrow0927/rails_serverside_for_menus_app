# == Schema Information
#
# Table name: s3_files
#
#  id                       :integer         not null, primary key
#  owner                    :string(255)
#  notes                    :text
#  created_at               :datetime        not null
#  updated_at               :datetime        not null
#  last_accessed_by_user    :string(255)
#  last_accessed_time_stamp :datetime
#  upload_file_name         :string(255)
#  upload_content_type      :string(255)
#  upload_file_size         :integer
#  upload_updated_at        :datetime
#  owner_role               :string(255)
#

class S3File < ActiveRecord::Base

  #PaperClip methods
  attr_accessible :upload

  #This method sets the folder structure that Paperclip will use to save the files on AWS
  #The first bit sets the folder name to the user email and the second bit sets the name of the
  #internal folder to the datetime the file was created
  Paperclip.interpolates :prefix  do |attachment, style|
     "#{attachment.instance.owner}/#{Date.today.to_s }"

  end

  has_attached_file(  :upload,
                      :path => ":prefix/:basename.:extension",
                      :storage => :s3,
                      :s3_credentials => {:access_key_id => "AKIAJNDXKKUIGXCX5TPA",
                                          :secret_access_key => "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"},
                      :bucket => "app0521"
                    )




  #Used to connect to users through the join table
  has_many :user_resource_relationships
  has_many :users, :through => :user_resource_relationships



end
