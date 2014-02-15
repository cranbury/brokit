class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @search = Apartment.search do
      fulltext params[:search]
    end
    @apartment = @search.results
  end
end