class Apartment < ActiveRecord::Base


  belongs_to :landlord

  searchable do
    text :address, :description

  end
end