module SessionsHelper
  def log_in(user)
    session[:user_id]=user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user=nil
  end

  #True if the user is logged in, false otherwise
  def logged_in?
    return !current_user.nil?
  end

  def current_user
    if @current_user.nil?
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user
    end
    return @current_user
  end
end
