class UsersController < ApplicationController
  #GET users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        if @user.user_type=='m'
          format.html {redirect_to new_musician_path, notice: 'User account was successfully created.', uid: @user.id}
        else
          format.html { redirect_to @user, notice: 'User account was successfully created.' }
        end
      else
        if @user.user_type=='m'
          format.html { render 'bands/newacct' }
        else
          format.html { render :new }
        end
      end
    end
  end

  #GET users/edit
  def edit
  end

  #PATCH/PUT users/1
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

  #GET users/1
  def show
  end

  #DELETE users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :user_type)
  end
end
