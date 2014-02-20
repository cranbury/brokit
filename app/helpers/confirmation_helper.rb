module ConfirmationHelper
  def check_code
    user = User.find(params[:id])
    if user.confirmation_code == params[:code]
      user.confirmed = true
      user.save
      session[:user_id] = user.id
    end
    redirect_to edit_user_path(user)
  end

  def generate_code
    SecureRandom.urlsafe_base64
  end


end