# == Schema Information
#
# Table name: user_resource_relationships
#
#  id                       :integer         not null, primary key
#  s3_file_id               :integer
#  user_id                  :integer
#  created_at               :datetime        not null
#  updated_at               :datetime        not null
#  summary                  :text
#  last_accessed_by_user    :string(255)
#  last_accessed_time_stamp :datetime
#

class UserResourceRelationship < ActiveRecord::Base

  belongs_to :s3_file
  belongs_to :user



end
