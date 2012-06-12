class ListingsController < ApplicationController
  before_filter :authenticate_user! 
  
=begin  
  def get_all
    @temp_listings = TempListing.order("name ASC")
  end
  
  def create_listings_from_temp_listings
    self.get_all
    @temp_listings.each do|temp_listing|
      
      @listing = Listing.new()
      @listing.name = temp_listing.name
      @listing.telephone = temp_listing.telephone
      @listing.fax = temp_listing.fax
      @listing.suite = temp_listing.suite
      @listing.address = temp_listing.address
      @listing.city = temp_listing.city
      @listing.province = temp_listing.province
      @listing.postal_code = temp_listing.postal_code
      @listing.latitude = temp_listing.latitude
      @listing.longitude = temp_listing.longitude
      @listing.businessType = temp_listing.businessType
      @listing.subType = temp_listing.subType
      @listing.owner = temp_listing.owner
      @listing.source = temp_listing.source
      @listing.localArea = temp_listing.localArea
            
      @listing.save
      
    end
  end
  

  def create_listings_from_addresses
    @addresses = Address.order("business_name ASC")
    @addresses.each do|address|
      @listing = Listing.new()
      @listing.name = address.business_name
      @listing.telephone = address.telephone_1
      @listing.fax = address.fax
      @listing.suite = "YP"
      @listing.address = address.address
      @listing.city = address.city
      @listing.province = "BC"
      @listing.postal_code = "YP"
      @listing.latitude = nil
      @listing.longitude = nil
      @listing.business_type = "YP"
      @listing.sub_type = "YP"
      @listing.owner = "YP"
      @listing.source = "Leah's yellow pages goodies ;-)"
      @listing.local_area = "YP"
      @listing.menu_collected = nil
      @listing.menu_digitized = nil
      @listing.menu_in_database = nil
      @listing.keep = true
      @listing.get_menu_from_website = nil
      @listing.notes = "Secondary Phone: #{address.telephone_2}"
      @listing.menu_state = nil
      @listing.menu_source = "not_applicable"
                  
      @listing.save
      
    end
  end
=end 
  
  
  
  
  def geoView
    @listings = Listing.all
    #self.create_listings_from_addresses
    #render :text=>(@listings).to_json()
    #render :json =>@listings
    respond_to do |format|
         format.html #list.html.erb
         format.json {render :json =>@listings}
       end
  end
  
  
  
 
  # GET /listings
  # GET /listings.json
  def index
    #self.create_listings_from_temp_listings
    #@listings = Listing.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: ListingsDatatable.new(view_context) } 
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @listing }
    end
  end

  # GET /listings/new
  # GET /listings/new.json
  def new
    @listing = Listing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listing }
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(params[:listing])

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render json: @listing, status: :created, location: @listing }
      else
        format.html { render action: "new" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /listings/1
  # PUT /listings/1.json
  def update
    @listing = Listing.find(params[:id])
    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url }
      format.json { head :no_content }
    end
  end
end
