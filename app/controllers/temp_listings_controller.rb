class TempListingsController < ApplicationController
  
  before_filter :authenticate_user! 
  
  # GET /temp_listings
  # GET /temp_listings.json
  def index
    @temp_listings = TempListing.order("name ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @temp_listings }
    end
  end

  # GET /temp_listings/1
  # GET /temp_listings/1.json
  def show
    @temp_listing = TempListing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @temp_listing }
    end
  end

  # GET /temp_listings/new
  # GET /temp_listings/new.json
  def new
    @temp_listing = TempListing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @temp_listing }
    end
  end

  # GET /temp_listings/1/edit
  def edit
    @temp_listing = TempListing.find(params[:id])
  end

  # POST /temp_listings
  # POST /temp_listings.json
  def create
    @temp_listing = TempListing.new(params[:temp_listing])

    respond_to do |format|
      if @temp_listing.save
        format.html { redirect_to @temp_listing, notice: 'Temp listing was successfully created.' }
        format.json { render json: @temp_listing, status: :created, location: @temp_listing }
      else
        format.html { render action: "new" }
        format.json { render json: @temp_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /temp_listings/1
  # PUT /temp_listings/1.json
  def update
    @temp_listing = TempListing.find(params[:id])

    respond_to do |format|
      if @temp_listing.update_attributes(params[:temp_listing])
        format.html { redirect_to @temp_listing, notice: 'Temp listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @temp_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temp_listings/1
  # DELETE /temp_listings/1.json
  def destroy
    @temp_listing = TempListing.find(params[:id])
    @temp_listing.destroy

    respond_to do |format|
      format.html { redirect_to temp_listings_url }
      format.json { head :no_content }
    end
  end
end
