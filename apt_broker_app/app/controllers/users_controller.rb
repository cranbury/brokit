class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    redirect_to apartments_path
  end
end