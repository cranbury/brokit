class ApartmentsController < ApplicationController
  before_action :authenticate!
  before_action(:load_apartment, {only: [:show, :edit, :update, :destroy]})

  include NeighborhoodHelper

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.create(apartment_params)
    @apartment.neighborhood = get_neighborhood(@apartment)
    #binding.pry
    @apartment.save
    redirect_to apartment_path(@apartment)
  end

  def index
    # Apartment.reindex
    # @apartments = Apartment.search params[:search]
    # @search = Apartment.search do
    #   fulltext params[:search]
    # end
    # @apartments = @search.results
    # @apartments = @apartments.where(bedrooms: params[:bedrooms])
    # binding.pry
    @apartments ||= Apartment.all
  end

  def show
  end

  def load_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.require(:apartment).permit(:neighborhood, :address, :price, :lease_length, :bedrooms, :bathrooms, :description, :contact_name, :phone_number, :email, :photo_url, :landlord_id)
  end

  def check_login
    #binding.pry
    redirect_to login_path unless session[:user_id]
  end
end