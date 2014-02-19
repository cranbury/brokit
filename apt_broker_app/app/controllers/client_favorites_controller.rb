class ClientFavoritesController < ApplicationController

 before_action :authenticate!

  include NeighborhoodHelper
  include SearchHelper

  def new
    @client_favorite = ClientFavorite.new
  end

  def create
    @client_favorite = ClientFavorite.new(client_favorite_params)

    @client_favorite.save
    redirect_to apartment_path(@client_favorite.apartment_id)
  end

  def destroy
    client_num = params[:client_id]
    ClientFavorite.find(params[:id]).destroy
    redirect_to client_path(params[client_num])
  end

  # def index
  #   @client_favorites = Client_Favorite.all
  # end

  # def show
  #   @client_favorite = Client_Favorite.find(params[:id])
  # end

  # def edit
  #   @client_favorite = Client_Favorite.find(params[:id])
  # end

  # def update
  #   @client_favorite = Client_Favorite.find(params[:id])
  #   @client_favorite.update(client_favorite_params)
  #   redirect_to user_path(@user)
  # end


  def client_favorite_params
    params.require(:client_favorite).permit(:client_id, :apartment_id, :status, :notes)
  end

  def check_login
    #binding.pry
    redirect_to login_path unless session[:user_id]
  end
end
