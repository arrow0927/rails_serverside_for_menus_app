# == Schema Information
#
# Table name: tasks
#
#  id                   :integer         not null, primary key
#  last_run_at_time     :string(255)
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  description          :text
#  task_name            :string(255)
#  last_run_by_user     :string(255)
#  output_from_last_run :text
#

class Task < ActiveRecord::Base
   #Refer to this URL to see how to run a rake task in a model
  #http://railscasts.com/episodes/127-rake-in-background
  def run_task
    if self.task_name="menu_state_count"
      self.description="#{self.task_name} Started at #{Time.now}"
      #system "rake menu_state_count TASK_NAME=#{self.task_name}"
      system "rake menu_state_count"
    elsif self.task_name=""

    end
    self.save
  end


end
