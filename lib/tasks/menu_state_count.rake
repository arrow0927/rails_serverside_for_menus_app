task :menu_state_count => :environment do

  desc "This will get the menu state counts of all the known menu states"

  @listings = Listing.all.count
  puts "Total Listings = #{@listings}"

  @physical_menu_count = Listing.where("listings.menu_state = 'physical_menu_collected' " ).count
  puts "Total physical menus collected = #{@physical_menu_count}"

  @url_collected = Listing.where("listings.menu_state = 'url_collected' " ).count
  puts "Total url collected = #{@url_collected}"

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

  @not_yet_collected = Listing.where("listings.menu_state = 'not_yet_collected' " ).count
  puts "Not Yet Collected = #{@not_yet_collected}"

  @not_a_restaurant = Listing.where("listings.menu_state = 'not_a_restaurant' " ).count
  puts "Not A Restaurant = #{@not_a_restaurant}"

  @refused_to_give = Listing.where("listings.menu_state = 'refused_to_give' " ).count
  puts "Refused to give = #{@refused_to_give}"

  @outside_downtown = Listing.where("listings.menu_state = 'outside_downtown' " ).count
  puts "Outside Downtown = #{@outside_downtown}"


  puts "The following listings are not valid statuses and need to be changed "
  @invalid_with_space = Listing.where("listings.menu_state = '' " ).count
  puts "Invalid with \"\" = #{@invalid_with_space}"

  @invalid_with_spaces = Listing.where("listings.menu_state = ' ' " ).count
  puts "Invalid with \" \" = #{@invalid_with_spaces}"

  @invalid_with_null = Listing.where("listings.menu_state IS null" ).count
  puts "Invalid with null = #{@invalid_with_null}"


end
