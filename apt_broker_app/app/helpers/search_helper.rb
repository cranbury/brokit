module SearchHelper

  def search_apartment(price)
    Apartment.search do
      with :price.less_than_or_equal_to search[:price]
      order_by :price, :desc
      paginate :page => 2, :per_page => 15
      facet :address
    end
  end


end