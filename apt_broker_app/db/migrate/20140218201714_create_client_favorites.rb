class CreateClientFavorites < ActiveRecord::Migration
  def change
    create_table :client_favorites do |t|

      t.string :status
      t.text :notes

      t.references :apartment
      t.references :client
    end
  end
end
