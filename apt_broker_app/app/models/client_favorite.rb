class ClientFavorite < ActiveRecord::Base
  belongs_to :client
  belongs_to :apartment

end