class ClientsController < ApplicationController

 before_action :authenticate!

  include NeighborhoodHelper

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    user = User.find(session[:user_id])
    
    user.clients << @client

    redirect_to client_path(@client)
  end

  def index
    @clients = Client.all
    @user = User.find(session[:user_id])
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    redirect_to user_path(@user)
  end


  def client_params
    params.require(:client).permit(:name, :bedrooms_needed, :price_limit, :phone_number, :email, :notes)
  end

  def check_login
    #binding.pry
    redirect_to login_path unless session[:user_id]
  end
end
