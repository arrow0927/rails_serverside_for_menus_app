module TasksHelper
  #Define all tasks here that will be used by the Task module
  @buffer = ""
  def  menu_state_count
    @buffer = "\n\nThe following is the count of all the state of the menus for each listing\n\n"

    @listings = Listing.all.count
    @buffer << "Total Listings = #{@listings} \n"

    @sent_to_India = Listing.where("listings.menu_state = 'sent_to_India' " ).count
    @buffer <<  "Sent to India = #{@sent_to_India} \n"
    @converted_to_Excel = Listing.where("listings.menu_state = 'converted_to_Excel' " ).count
    @buffer << "Converted to Excel = #{@converted_to_Excel} \n"
    @cleansed = Listing.where("listings.menu_state = 'cleansed' " ).count
    @buffer << "Cleansed = #{@cleansed} \n"
    @tagged = Listing.where("listings.menu_state = 'tagged' " ).count
    @buffer << "Tagged = #{@tagged} \n"
    @inserted_in_DB = Listing.where("listings.menu_state = 'inserted_in_DB' " ).count
    @buffer << "Inserted into db = #{@inserted_in_DB} \n"
    @not_collected = Listing.where("listings.menu_state = 'not_collected' " ).count
    @buffer << "Not Collected = #{@not_collected} \n"
    @not_a_restaurant = Listing.where("listings.menu_state = 'not_a_restaurant' " ).count
    @buffer << "not_a_restaurant = #{@not_a_restaurant} \n"
    @refused_to_give = Listing.where("listings.menu_state = 'refused_to_give' " ).count
    @buffer << "Refused to give = #{@refused_to_give} \n"
    @outside_downtown = Listing.where("listings.menu_state = 'outside_downtown' " ).count
    @buffer << "Outside Downtown = #{@outside_downtown} \n"
    @collect_from_location = Listing.where("listings.menu_state = 'collect_from_location' " ).count
    @buffer << "collect_from_location = #{@collect_from_location} \n"
    @invalid_with_space = Listing.where("listings.menu_state = '' " ).count
    @buffer << "Invalid with \"\" = #{@invalid_with_space} \n"
    @invalid_with_spaces = Listing.where("listings.menu_state = ' ' " ).count
    @buffer << "Invalid with \" \" = #{@invalid_with_spaces} \n"
    @invalid_with_null = Listing.where("listings.menu_state IS null" ).count
    @buffer << "Invalid with null = #{@invalid_with_null} \n"

  end

  def read_csv_net_http
    @buffer = "From Tasks Helper read_csv_net_http #{Time.now}"
    @buffer << "Testing <<"
  end

  def read_csv_open_uri
    @buffer = "From Tasks Helper read_csv_net_http #{Time.now}"
    @buffer << "Testing <<"
  end

  def copy_dupes_from_listings
    @buffer = "From Tasks Helper copy_dupes_from_listings #{Time.now}"
    @buffer << "Testing <<"
  end

  def remove_dupes_from_listings
    @buffer = "From Tasks Helper remove_dupes_from_listings#{Time.now}"
    @buffer << "Testing <<"
  end

  def set_menu_state
    @buffer = "From Tasks Helper set_menu_state#{Time.now}"
    @buffer << "Testing <<"
  end



end
