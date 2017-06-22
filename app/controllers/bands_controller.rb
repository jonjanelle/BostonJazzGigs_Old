class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  # GET /bands/1
  def show
    @band = Band.includes(:musicians).find(params[:id])
  end

  # GET /bands/new
  def new
    @band = Band.new
  end

  # GET /bands/newacct
  #a band must make a user account first
  def newacct
    @user = User.new
    @user.user_type="m"
    return @user
  end

  # POST /bands
  def create
    @band = Band.new(band_params)
    respond_to do |format|
      if @band.save
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])
  end

  # PATCH/PUT /bands/1
  def update
    respond_to do |format|
    @band = Band.includes(:musicians).find(params[:id])
      if @band.update(band_params)
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
      else
        format.html {render :edit}
      end
    end
  end

  # DELETE /bands/1
  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_path
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def band_params
    params.require(:band).permit(:name, :genre, :description, :email,
                                 :url, :image, :songdemo1, :songdemo1_title,
                                 :songdemo2, :songdemo2_title,
                                 :zipcode, :radius)
  end
end
