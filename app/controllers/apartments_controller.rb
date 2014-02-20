class ApartmentsController < ApplicationController
  before_action :authenticate!
  before_action(:load_apartment, {only: [:show, :edit, :update, :destroy]})

  include NeighborhoodHelper


  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.neighborhood = get_neighborhood(@apartment)

    @apartment.save
    redirect_to apartment_path(@apartment)
  end

  def index
    text_search = Apartment.all

    criteria = {price: (0..(params[:price].to_i)), bedrooms: params[:bedrooms], neighborhood: params[:neighborhood]}
    criteria.delete_if {|k,v| v.blank?}
    attr_search_results = Apartment.where(criteria)
 
    @apartments = attr_search_results #& other resultst
  end

  def show
    @client_favorite = ClientFavorite.new
  end

  def edit
    @apartment = Apartment.find(params[:id])
  end

  def update
    @apartment = Apartment.find(params[:id])
    @apartment.update(apartment_params)
    redirect_to apartment_path(@apartment)
  end

  def destroy
    @apartment.destroy
    redirect_to apartments_path
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