class UnusedListingsController < ApplicationController
  before_filter :authenticate_user!
  
  def get_all_unused_listings
    @listings_to_be_removed = Listing.where(:keep => false)
  end
  
  def create_unused_listings
    self.get_all_unused_listings
    
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
   
    end
    
  end
  
  
  
  
  
  # GET /unused_listings
  # GET /unused_listings.json
  def index
    #self.create_unused_listings
    #Listing.destroy_all(:keep =>false)
    #@listings = Listing.all
    @unused_listings = UnusedListing.order("name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unused_listings }
    end
  end

  # GET /unused_listings/1
  # GET /unused_listings/1.json
  def show
    @unused_listing = UnusedListing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unused_listing }
    end
  end

  # GET /unused_listings/new
  # GET /unused_listings/new.json
  def new
    @unused_listing = UnusedListing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unused_listing }
    end
  end

  # GET /unused_listings/1/edit
  def edit
    @unused_listing = UnusedListing.find(params[:id])
  end

  # POST /unused_listings
  # POST /unused_listings.json
  def create
    @unused_listing = UnusedListing.new(params[:unused_listing])

    respond_to do |format|
      if @unused_listing.save
        format.html { redirect_to @unused_listing, notice: 'Unused listing was successfully created.' }
        format.json { render json: @unused_listing, status: :created, location: @unused_listing }
      else
        format.html { render action: "new" }
        format.json { render json: @unused_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unused_listings/1
  # PUT /unused_listings/1.json
  def update
    @unused_listing = UnusedListing.find(params[:id])

    respond_to do |format|
      if @unused_listing.update_attributes(params[:unused_listing])
        format.html { redirect_to @unused_listing, notice: 'Unused listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unused_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unused_listings/1
  # DELETE /unused_listings/1.json
  def destroy
    @unused_listing = UnusedListing.find(params[:id])
    @unused_listing.destroy

    respond_to do |format|
      format.html { redirect_to unused_listings_url }
      format.json { head :no_content }
    end
  end
end
