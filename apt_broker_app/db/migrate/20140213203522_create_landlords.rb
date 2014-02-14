class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.text :notes
    end
  end
end
