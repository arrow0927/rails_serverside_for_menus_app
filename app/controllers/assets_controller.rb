class AssetsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /assets
  # GET /assets.json
  def index
    #@assets = Asset.all
    @assets = current_user.assets
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assets }
    end
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
    #@asset = Asset.find(params[:id])
    @asset = current_user.assets.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset }
    end
  end

  # GET /assets/new
  # GET /assets/new.json
  def new
    #@asset = Asset.new
    @asset = current_user.assets.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asset }
    end
  end

  # GET /assets/1/edit
  def edit
    #@asset = Asset.find(params[:id])
    @asset = current_user.assets.find(params[:id])
  end

  # POST /assets
  # POST /assets.json
  def create
    #@asset = Asset.new(params[:asset])
     @asset = current_user.assets.new(params[:asset])
     
    respond_to do |format|
      if @asset.save
        format.html { redirect_to @asset, notice: 'Asset was successfully created.' }
        format.json { render json: @asset, status: :created, location: @asset }
      else
        format.html { render action: "new" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assets/1
  # PUT /assets/1.json
  def update
    #@asset = Asset.find(params[:id])
    @asset = current_user.assets.find(params[:id])
    
    respond_to do |format|
      if @asset.update_attributes(params[:asset])
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    #@asset = Asset.find(params[:id])
    @asset = current_user.assets.find(params[:id])  
    
    @asset.destroy

    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end
  
  #This action will let the users download the files (after a simple authorization check)
  def get
   asset = current_user.assets.find_by_id(params[:id])
   if asset
     send_file asset.uploaded_file.path, :type=> asset.uploaded_file_content_type
   else
     flash[:error]="Dont be cheeky! Mind your own assets"
     redirect_to assets_path
   end
  end
  
  
end
