class LandlordsController < ApplicationController
  before_action :authenticate!

  include NeighborhoodHelper
  include SearchHelper

  def new
    @landlord = Landlord.new
  end

  def create
    @landlord = Landlord.create(landlord_params)

    @landlord.save
    redirect_to apartment_path(@apartment)
  end

  def index
    @landlords = Landlord.all
  end

  def show
    @landlord = Landlord.find(params[:id])
  end

  def edit
    @landlord = Landlord.find(params[:id])
  end

  def update
    @landlord = Landlord.find(params[:id])
    @landlord.update(landlord_params)
    redirect_to user_path(@user)
  end


  def landlord_params
    params.require(:landlord).permit(:name, :phone_number, :email, :notes)
  end

  def check_login
    #binding.pry
    redirect_to login_path unless session[:user_id]
  end
end