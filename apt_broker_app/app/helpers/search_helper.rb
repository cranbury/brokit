module SearchHelper

  def search_apt(price, bedrooms, neighborhood)
    @apartments = Apartment.all
    unless price = ""
      @apartments = @apartments.where("price <= ?", price)
    end
    unless bedrooms = ""
      @apartments = @apartments.where("bedrooms = ?", bedrooms)
    end
    unless neighborhood = ""
      @apartments = @apartments.where("neighborhood = ?", neighborhood)
    end
    
    @apartments
  end


end