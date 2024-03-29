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
        flash.now[:success]='User account was successfully created.'
        log_in(@user)
        if @user.user_type=='m'
          format.html {redirect_to new_musician_path, uid: @user.id}
        else
          format.html { redirect_to @user }
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
    @user = User.find(params[:id])
  end

  #PATCH/PUT users/1
  def update
    respond_to do |format|
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success]='User was successfully updated.'
        format.html { redirect_to @user }
      else
        format.html {render :edit}
      end
    end
  end

  #GET users/1
  def show
    @user = User.find(params[:id])
    if (!session[:user_id].nil?) && @user.id == current_user.id
      @user = User.find(params[:id])
      return @user
    else
      flash[:danger]="You are either not logged in or you do not own the requested account."
      redirect_to login_path
    end
  end

  #DELETE users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to home_path
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :user_type)
  end
end
