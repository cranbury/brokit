class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.text :name
      t.integer :bedrooms_needed
      t.integer :price_limit
      t.string :phone_number
      t.string :email
      t.text :notes

      t.references :user
    end
  end
end
