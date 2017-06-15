class BandsController < ApplicationController
  def index
    @bands = Band.includes(:musicians).all
  end

  # GET /bands/1
  def show
    @band = Band.find(params[:id])
  end

  # GET /bands/new
  def new
    @band = Band.new
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
    @band = Band.find(params[:id])
      if @band.update(band_params)
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
      else
        format.html {render :edit}
      end
    end
  end

  # DELETE /bands/1
  def destroy
    @band = Article.find(params[:id])
    @band.destroy
    redirect_to band_path
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def band_params
    params.require(:band).permit(:name, :genre, :description, :image, :songdemo, :zipcode, :radius)
  end
end
