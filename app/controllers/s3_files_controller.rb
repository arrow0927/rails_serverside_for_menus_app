class S3FilesController < ApplicationController

  before_filter :authenticate_user!


  # GET /s3_files
  # GET /s3_files.json
  def index
    @s3_files = S3File.all
    #@s3_files = current_user.s3_files

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @s3_files }
    end
  end

  # GET /s3_files/1
  # GET /s3_files/1.json
  def show
   @s3_file = S3File.find(params[:id])
   #@s3_file = current_user.s3_files.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @s3_file }
    end
  end


  # GET /s3_files/new
  # GET /s3_files/new.json
  def new
    @s3_file = S3File.new
    @s3_file.owner = current_user.email
    #Commented this line below because it was causing error after deployment to Heroku
    #Error was no method error
   # @s3_file.owner_role= current_user.role

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @s3_file }
    end
  end

  # GET /s3_files/1/edit
  def edit
    @s3_file = S3File.find(params[:id])
    #@s3_file = current_user.s3_files.find(params[:id])

  end


  # POST /s3_files
  # POST /s3_files.json
  def create
    @s3_file = S3File.new(params[:s3_file])
    @s3_file.owner = current_user.email

    respond_to do |format|
      if @s3_file.save
        format.html { redirect_to @s3_file, notice: 'S3 file was successfully created.' }
        format.json { render json: @s3_file, status: :created, location: @s3_file }
      else
        format.html { render action: "new" }
        format.json { render json: @s3_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /s3_files/1
  # PUT /s3_files/1.json
  def update
    @s3_file = S3File.find(params[:id])
    #@s3_file = current_user.s3_files.find(params[:id])

    respond_to do |format|
      if @s3_file.update_attributes(params[:s3_file])
        format.html { redirect_to @s3_file, notice: 'S3 file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @s3_file.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /s3_files/1
  # DELETE /s3_files/1.json
  def destroy
    @s3_file = S3File.find(params[:id])
    @s3_file.destroy

    respond_to do |format|
      format.html { redirect_to s3_files_url }
      format.json { head :no_content }
    end
  end
end
