class UsersController < ApplicationController
    before_action :authenticate!
    include ConfirmationHelper

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

  def edit
    @user = User.find(params[:id])
    if @user == current_user || @user.account_type == "admin"
      render(:edit)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_end_params)
    redirect_to user_path(@user)
  end

  def user_end_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :account_type, :password, :password_confirmation)
  end
end