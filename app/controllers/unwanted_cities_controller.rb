class UnwantedCitiesController < ApplicationController
  before_filter :authenticate_user! 
  
  def create_unwanted_listings

    @listings = Listing.where(['city != ?', "Vancouver"]).where(['city != ?', " Vancouver"]).where(['city != ?', "Vancouver "])

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
  
  # GET /unwanted_cities
  # GET /unwanted_cities.json
  def index
    #self.create_unwanted_listings
    #@unwanted_cities = Listing.where(['city != ?', "Vancouver"]).where(['city != ?', " Vancouver"]).where(['city != ?', "Vancouver "])
    #Listing.where(['city != ?', "Vancouver"]).where(['city != ?', " Vancouver"]).where(['city != ?', "Vancouver "]).each{|r| r.destroy }
    
    @unwanted_cities = UnwantedCity.all
    #UnwantedCity.destroy_all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unwanted_cities }
    end
  end

  # GET /unwanted_cities/1
  # GET /unwanted_cities/1.json
  def show
    @unwanted_city = UnwantedCity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unwanted_city }
    end
  end

  # GET /unwanted_cities/new
  # GET /unwanted_cities/new.json
  def new
    @unwanted_city = UnwantedCity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unwanted_city }
    end
  end

  # GET /unwanted_cities/1/edit
  def edit
    @unwanted_city = UnwantedCity.find(params[:id])
  end

  # POST /unwanted_cities
  # POST /unwanted_cities.json
  def create
    @unwanted_city = UnwantedCity.new(params[:unwanted_city])

    respond_to do |format|
      if @unwanted_city.save
        format.html { redirect_to @unwanted_city, notice: 'Unwanted city was successfully created.' }
        format.json { render json: @unwanted_city, status: :created, location: @unwanted_city }
      else
        format.html { render action: "new" }
        format.json { render json: @unwanted_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unwanted_cities/1
  # PUT /unwanted_cities/1.json
  def update
    @unwanted_city = UnwantedCity.find(params[:id])

    respond_to do |format|
      if @unwanted_city.update_attributes(params[:unwanted_city])
        format.html { redirect_to @unwanted_city, notice: 'Unwanted city was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unwanted_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unwanted_cities/1
  # DELETE /unwanted_cities/1.json
  def destroy
    @unwanted_city = UnwantedCity.find(params[:id])
    @unwanted_city.destroy

    respond_to do |format|
      format.html { redirect_to unwanted_cities_url }
      format.json { head :no_content }
    end
  end
end
