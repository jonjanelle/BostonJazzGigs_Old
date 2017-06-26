class MusiciansController < ApplicationController
  # GET /musicians/new
  def new
    @musician = Musician.new
    @musician.user_id = User.last.id
    return @musician
  end

  def create
    @musician = Musician.new(musician_params)
    respond_to do |format|
      if @musician.save
        flash.now[:success]='Musician profile created. You can now create a band or be added to the roster of an existing band!'
        format.html { redirect_to @musician }
      else
        format.html { render :new }
      end
    end
  end

  # POST /musicians
  def edit
    @musician = Musician.includes(:bands).find(params[:id])
  end

  # PATCH/PUT /musicians/1
  def update
    respond_to do |format|
    @musician = Musician.includes(:bands).find(params[:id])
      if @musician.update(musician_params)
        flash.now[:success]='Musician profile successfully updated.'
        format.html { redirect_to @musician }
      else
        format.html {render :edit}
      end
    end
  end

  # GET /musicians/1
  def show
    @musician = Musician.includes(:bands).find(params[:id])
  end

  private
  def musician_params
    params.require(:musician).permit(:firstname, :lastname, :instrument,
                                     :instrument2, :bio, :image, :user_id)
  end

end
