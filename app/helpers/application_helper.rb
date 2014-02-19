module ApplicationHelper

  def logged_in?
    session[:user_id].present?
  end

  def authenticate!
    unless logged_in?
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end

end
