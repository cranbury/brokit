class Apartment < ActiveRecord::Base
  belongs_to :landlord
  has_many :client_favorites, dependent: :destroy
  has_many :clients, through: :client_favorites

  searchable do
    text :address, :description

  end
end