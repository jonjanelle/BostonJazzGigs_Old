class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:email => params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to user
    end

    render 'new'
  end

  def destroy
  end
end
