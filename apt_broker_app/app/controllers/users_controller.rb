class UsersController < ApplicationController


  def new
    @user = User.new
    render(:new)
  end

  def create
    @user = User.new(user_params)
    @user.confirmation_code = generate_code
    @user.save

    UserMailer.welcome_email(@user).deliver
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :account_type, :password, :password_confirmation)
  end

  def check_code
    user = User.find(params[:id])
    binding.pry
    if user.confirmation_code == params[:code]
      user.confirmed = true
      user.save
    end
    redirect_to user_path(user)
  end

  def generate_code
    SecureRandom.urlsafe_base64
  end


end