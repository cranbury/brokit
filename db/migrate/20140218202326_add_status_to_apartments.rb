class AddStatusToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :status, :text, default: "available"
  end
end
