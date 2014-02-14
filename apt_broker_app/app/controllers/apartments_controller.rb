class ApartmentsController < ApplicationController
  before_action :authenticate!
  before_action(:load_apartment, {only: [:show, :edit, :update, :destroy]})

  def new
    @apartment = Apartment.new
  end

  def create
    binding.pry
    @apartment = Apartment.create(apartment_params)
    redirect_to apartment_path(@apartment)
  end

  def show
  end

  def load_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.require(:apartment).permit(:address, :price, :lease_length, :bedrooms, :bathrooms, :description, :contact_name, :phone_number, :email, :photo_url, :landlord_id)
  end

  def check_login
    #binding.pry
    redirect_to login_path unless session[:user_id]
  end
end