module FindHelper
  def ny_search(search)
    HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{search.gsub(" ", "+")},+New+York,+NY&sensor=true&key=#{google_key}")
  end

  def neighborhood(api_return)
    right_hsh = api_return["results"].first["address_components"].select do |hsh|
       hsh["types"].include?("neighborhood")
     end

     neighborhood = right_hsh.first["long_name"]
  end

  def get_neighborhood(apt)
    neighborhood(ny_search(apt.address))
  end

  def google_key
    GOOGLE_API_ID
  end

end