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
  include TasksHelper

  #include ActionView::Helpers
  #ActionController::Base.helpers.sanitize(str)

  #All the tasks invoked in the following method are defined in the TasksHelper module
  def run_task(user_id)
    @usr = User.find(user_id)
    case self.task_name

      when "menu_state_count"
        self.description = "menu_state_count ran at #{Time.now} by #{@usr.email}"
        self.output_from_last_run = menu_state_count
      when "read_csv_net_http"
        self.description = "read_csv_net_http ran at #{Time.now} by #{@usr.email}"
        self.output_from_last_run = read_csv_net_http
      when "read_csv_open_uri"
        self.description = "read_csv_open_uri ran at #{Time.now} by #{@usr.email}"
        self.output_from_last_run = read_csv_open_uri
      when "copy_dupes_from_listings"
        self.description = "copy_dupes_from_listings ran at #{Time.now} by #{@usr.email}"
        self.output_from_last_run = copy_dupes_from_listings
      when "remove_dupes_from_listings"
        self.description = "remove_dupes_from_listings ran at #{Time.now} by #{@usr.email}"
        self.output_from_last_run = remove_dupes_from_listings
      when "set_menu_state"
        self.description = "set_menu_state ran at #{Time.now} by #{@usr.email}"
        self.output_from_last_run = set_menu_state
      else
        self.description = "<ERROR> ran at #{Time.now} User = #{@usr.email}"
        self.output_from_last_run = "<ERROR>#{Time.now} User = #{@usr.email}"

    end

    self.save
  end






end
