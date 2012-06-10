task :set_menu_state => :environment do
  desc "This is a task that will take the values of 3 check boxes: 
  Menu Collected, Menu Digitized, Menu in Database and set the value of Menu State"
  @listings = Listing.all
  
  @listings.each do |listing|
   if listing.menu_collected
    listing.menu_state = "collected"
    puts "Listing: #{listing.name} menu_state changed to collected"
   else
    listing.menu_state = "not_collected"
    puts "Listing: #{listing.name} menu_state changed to not_collected"
   end
   listing.save
  end
  
end
