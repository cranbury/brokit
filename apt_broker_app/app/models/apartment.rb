class Apartment < ActiveRecord::Base

  searchkick

  belongs_to :landlord

  searchable do
    text :address, :description

  end
end