class AddNeighborhoodToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :neighborhood, :string
  end
end
