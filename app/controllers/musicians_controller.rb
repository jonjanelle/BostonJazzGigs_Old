class MusiciansController < ApplicationController
  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.new(musician_params)
    respond_to do |format|
      if @musician.save
        format.html { redirect_to @musician, notice: 'Musician was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @musician = Musician.includes(:bands).find(params[:id])
  end

  def update
    respond_to do |format|
    @musician = Musician.includes(:bands).find(params[:id])
      if @musician.update(musician_params)
        format.html { redirect_to @musician, notice: 'Musician was successfully updated.' }
      else
        format.html {render :edit}
      end
    end
  end

  def show
    @musician = Musician.includes(:bands).find(params[:id])
  end

  private
  def musician_params
    params.require(:musician).permit(:firstname, :lastname, :email,
                                     :instrument, :instrument2, :bio, :image)
  end

end
