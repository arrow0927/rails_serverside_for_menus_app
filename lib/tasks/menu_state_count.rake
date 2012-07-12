task :menu_state_count => :environment do

  desc "This will get the menu state counts of all the known menu states"

  @listings = Listing.all.count
  puts "Total Listings = #{@listings}"
  puts "==============================================================================="
  @sent_to_India = Listing.where("listings.menu_state = 'sent_to_India' " ).count
  puts "Sent to India = #{@sent_to_India}"

  @converted_to_Excel = Listing.where("listings.menu_state = 'converted_to_Excel' " ).count
  puts "Converted to Excel = #{@converted_to_Excel}"

  @cleansed = Listing.where("listings.menu_state = 'cleansed' " ).count
  puts "Cleansed = #{@cleansed}"

  @tagged = Listing.where("listings.menu_state = 'tagged' " ).count
  puts "Tagged = #{@tagged}"

  @inserted_in_DB = Listing.where("listings.menu_state = 'inserted_in_DB' " ).count
  puts "Inserted into db = #{@inserted_in_DB}"

  @not_collected = Listing.where("listings.menu_state = 'not_collected' " ).count
  puts "Not Collected = #{@not_collected}"

  @not_a_restaurant = Listing.where("listings.menu_state = 'not_a_restaurant' " ).count
  puts "not_a_restaurant = #{@not_a_restaurant}"

  @refused_to_give = Listing.where("listings.menu_state = 'refused_to_give' " ).count
  puts "Refused to give = #{@refused_to_give}"

  @outside_downtown = Listing.where("listings.menu_state = 'outside_downtown' " ).count
  puts "Outside Downtown = #{@outside_downtown}"

  @collect_from_location = Listing.where("listings.menu_state = 'collect_from_location' " ).count
  puts "collect_from_location = #{@collect_from_location}"

  puts "==============================================================================="
  puts "The following listings are not valid statuses and need to be changed "
  @invalid_with_space = Listing.where("listings.menu_state = '' " ).count
  puts "Invalid with \"\" = #{@invalid_with_space}"

  @invalid_with_spaces = Listing.where("listings.menu_state = ' ' " ).count
  puts "Invalid with \" \" = #{@invalid_with_spaces}"

  @invalid_with_null = Listing.where("listings.menu_state IS null" ).count
  puts "Invalid with null = #{@invalid_with_null}"
  puts "==============================================================================="

end
