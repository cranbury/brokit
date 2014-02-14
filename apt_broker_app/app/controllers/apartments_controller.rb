class ApartmentsController < ApplicationController
  include ApplicationHelper
  before_action(:load_apartment, {only: [:show, :edit, :update, :destroy]})

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.create(apartment_params)
    redirect_to apartment_path(@apartment)
  end

  def show
  end

  def load_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.require(:apartment).permit(:address, :price, :lease_length, :bedrooms, :bathrooms, :description, :contact_name, :phone_number, :email, :photo_url)
  end
end