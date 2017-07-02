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
      if logged_in? && current_user.user_type=='m' && @band.save
        @band.band_musicians.create!(musician_id: current_user.musician.id)
        flash[:success]='Band was successfully created.'
        format.html { redirect_to @band }
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
        flash[:success] = 'Band was successfully updated.'
        format.html { redirect_to @band }
      else
        format.html {render :edit}
      end
    end
  end

  # DELETE /bands/1
  def destroy
    @band = Band.find(params[:id])
    flash.now[:sucess]="#{@band.name} was deleted."
    @band.destroy
    redirect_to bands_path
  end

  #
  # Functions for handling band_musician HABTM management
  #
  #GET /bands/1/addmusician
  def add_musician
    @band = Band.find(params[:id])
  end

  #POST /bands/1/addmusician
  def create_musician
    @band = Band.find(params[:band_id])
    respond_to do |format|
      if logged_in? && current_user.user_type=='m' && @band.in_band(current_user.id)
        if @band.in_band(params[:musician_id].to_i)
          flash[:danger]='The selected musician is already in the band!'
        else
          @band.band_musicians.create!(musician_id: params[:musician_id])
          flash[:success]='Musician successfully added!'
        end
        format.html { redirect_to @band }
      else
        flash[:danger]='An unknown error occurred while adding a musician. User: #{current_user.firstname} type: #{current_user.user_type} in band?: #{@band.in_band(current_user.id)}.'
        format.html { redirect_to @band }
      end
    end
  end


  def destoy_band_musician
    @band=Band.find(params[:band_id])
    @musician=Musician.find(params[:musician_id])
    @band.musicians.delete(@musician.id)
    flash[:success]="#{@musician.firstname} #{@musician.lastname} was removed from #{@band.name}."
    redirect_to @band
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
