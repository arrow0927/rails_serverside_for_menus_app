task :set_menu_state => :environment do

  desc "This will set the menu_state attribute of a listing"
  @listings = Listing.where("listings.menu_state = 'not_collected'")
  puts "Total not collected = #{@listings.count }"
  @listings.each do |listing|
    puts "#{listing.name}, #{listing.menu_state} changed to"
    listing.menu_state = :not_yet_collected
    puts "#{listing.name}, #{listing.menu_state} "
   listing.save
   end


  
end
