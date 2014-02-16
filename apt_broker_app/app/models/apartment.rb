class Apartment < ActiveRecord::Base

  searchkick

  belongs_to :landlord

  # searchable do
  #   text :address, :neighborhood
  #   integer :price

  # end
end