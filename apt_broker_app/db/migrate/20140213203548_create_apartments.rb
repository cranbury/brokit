class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.text :address
      t.integer :price
      t.integer :lease_length #months
      t.integer :bedrooms
      t.integer :bathrooms
      t.text :description
      t.string :contact_name
      t.string :phone_number
      t.string :email
      t.text :photo_url

      t.references :landlord
    end
  end
end

