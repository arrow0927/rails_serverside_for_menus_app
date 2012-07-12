task :copy_dupes_from_listings => :environment do
  desc "This task will copy duplicates from listings to unused listings after you check that the numbers make sense run the other rake task of remove_dupes_from_listings"
  puts 'Before starting the opration to count duplicates this is the number:'
  @number_of_listings_w_keep_false = Listing.where(:keep => false).count
  @total_num_listings = Listing.all.count
  @total_num_unused_listings =  UnusedListing.all.count
  puts "Number of listings with keep=false is #{@number_of_listings_w_keep_false }"
  puts "Number of total listings is #{@total_num_listings }"
  puts "Number of Unused listings is #{@total_num_unused_listings }"
  puts "Retrieving each listing where keep = false and saving them as unused listings"

  @counter = 0

  @listings_to_be_removed = Listing.where(:keep => false)
  @listings_to_be_removed.each do|listing|
    @unused_listing = UnusedListing.new()
    @unused_listing.name = listing.name
    @unused_listing.telephone = listing.telephone
    @unused_listing.fax = listing.fax
    @unused_listing.suite = listing.suite
    @unused_listing.address = listing.address
    @unused_listing.city = listing.city
    @unused_listing.province = listing.province
    @unused_listing.postal_code = listing.postal_code
    @unused_listing.latitude = listing.latitude
    @unused_listing.longitude = listing.longitude
    @unused_listing.business_type = listing.business_type
    @unused_listing.sub_type = listing.sub_type
    @unused_listing.owner = listing.owner
    @unused_listing.source = listing.source
    @unused_listing.local_area = listing.local_area
    @unused_listing.checked = listing.checked
    @unused_listing.menu_collected = listing.menu_collected
    @unused_listing.menu_digitized = listing.menu_digitized
    @unused_listing.menu_in_database = listing.menu_in_database
    @unused_listing.keep = listing.keep
    @unused_listing.get_menu_from_website = listing.get_menu_from_website
    @unused_listing.notes = listing.notes
    @unused_listing.menu_state = listing.menu_state
    @unused_listing.menu_source = listing.menu_source
    @unused_listing.save
    @counter = @counter + 1
  end

  puts "#{@counter} listings saved to unused listings"
  puts "After starting the opration to count duplicates this is the number:"
  @number_of_listings_w_keep_false = Listing.where(:keep => false).count
  @total_num_listings = Listing.all.count
  @total_num_unused_listings =  UnusedListing.all.count
  puts "Number of listings with keep=false is #{@number_of_listings_w_keep_false }"
  puts "Number of total listings is #{@total_num_listings }"
  puts "Number of Unused listings is #{@total_num_unused_listings }"

end

task :remove_dupes_from_listings => :environment do
  desc:"DESTRUCTIVE ACTION!!!!!This task will remove the duplicate listings from listings"
  @total_listings = Listing.all.count
  puts "Before deleting duplicates from listings there are #{@total_listings}listings"
  Listing.destroy_all(:keep =>false)
  @total_listings = Listing.all.count
  puts "After deleting duplicates from listings there are #{@total_listings}listings"





end

