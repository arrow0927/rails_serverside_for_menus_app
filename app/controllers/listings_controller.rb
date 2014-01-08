class ListingsController < ApplicationController
  before_filter :authenticate_user! 
  
  helper_method :sort_column, :sort_direction
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
#==============================================================================
 #Get unwanted listings from listings table
 def create_unwanted_listings_from_city
    #@listings = Listing.where("city != ?").order("name ASC").order("address ASC")
    @listings.each do|listing|
      @unwanted_city = UnwantedCity.new()
      @unwanted_city.name = listing.name
      @unwanted_city.telephone = listing.telephone
      @unwanted_city.fax = listing.fax
      @unwanted_city.suite = listing.suite
      @unwanted_city.address = listing.address
      @unwanted_city.city = listing.city
      @unwanted_city.province = listing.province
      @unwanted_city.postal_code = listing.postal_code
      @unwanted_city.latitude = listing.latitude
      @unwanted_city.longitude = listing.longitude
      @unwanted_city.business_type = listing.business_type
      @unwanted_city.sub_type = listing.sub_type
      @unwanted_city.owner = listing.owner
      @unwanted_city.source = listing.source
      @unwanted_city.local_area = listing.local_area
      @unwanted_city.checked =listing.checked
      @unwanted_city.menu_collected = listing.menu_collected 
      @unwanted_city.menu_digitized = listing.menu_digitized
      @unwanted_city.menu_in_database = listing.menu_in_database
      @unwanted_city.keep = listing.keep
      @unwanted_city.get_menu_from_website = listing.get_menu_from_website
      @unwanted_city.notes = listing.notes
      @unwanted_city.menu_state = listing.menu_state
      @unwanted_city.menu_source = listing.menu_source
                  
      @unwanted_city.save
      
    end
  end
  
  
  
  
  
#==============================================================================
  def geoView
    
    #self.create_listings_from_addresses
    #render :text=>(@listings).to_json()
    #render :json =>@listings
    respond_to do |format|
         format.html do#list.html.erb
           @listings = Listing.all
         end
          @listings = Listing.all
         format.json {render :json =>@listings}
     end
  end
#============NON DATATABLES VERSION OF INDEX================================================  
=begin
  def index
    
    #@listings = Listing.order(params[:sort] + " " +  params[:direction])
    @listings = Listing.search(params[:search]).order(sort_column + " " +  sort_direction ).paginate(:per_page => 20, :page => params[:page])
    #respond_to do |format|
     # format.html # index.html.erb
      #format.json { render json: @listing }
    #end
  end
=end
#======DATATABLES VERSION OF INDEX METHOD
 # GET /listings
  # GET /listings.json
  def index
    #self.create_listings_from_temp_listings
    
    respond_to do |format|
      format.html do# index.html.erb
        @listings = Listing.all
        #@listings = Listing.where(:keep => false)
      end
      format.json { render json: ListingsDatatable.new(view_context) } 
      #format.pdf do 
        #pdf = Prawn::Document.new
        #pdf.text "Hello World"
        #send_data pdf.render, filename: "listings.pdf", type: "application/pdf", disposition: "inline"
      #end
      
    end
  end
#=============================================

  # GET /listings/1
  # GET /listings/1.json
  def show
    respond_to do |format|
      format.html do # show.html.erb
       @listing = Listing.find(params[:id]) 
      end
      format.json { render json: @listing }
      #format.pdf do 
        #pdf = Prawn::Document.new
        #pdf.text "Hello World"
        #send_data pdf.render
      #end
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
        #format.html { redirect_to listings_url , notice: 'Listing was successfully updated.'}
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { head :no_content }
        #format.js
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
  
  def show_notes
    #@listings = Listing.where("listings.notes IS NOT NULL").order("listings.name ASC")
    @listings = Listing.where("listings.menu_state = 'collect_from_location' OR listings.menu_state = 'outside_downtown'").order("listings.name ASC")
    #@listings = Listing.order("listings.menu_state").order("listings.menu_source")
    #@listings = Listing.all
    #@listings = Listing.order("listings.name ASC")
    #@listings = Listing.where('menu_state <> ?', "not_a_restaurant").where('menu_state <> ?',"collected").where('menu_state <> ?',"digitized").where('menu_state <> ?',"pending")


    #@listings = Listing.order('listings.menu_state ASC').order("listings.name ASC")
    respond_to do |format|
        format.pdf do
        #pdf = Prawn::Document.new
        pdf = ListingsNotes.new(@listings)

        send_data pdf.render, filename: "listings_notes.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end
  
  
  
  private
  #used by non datatables index
  def sort_column
    Listing.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
