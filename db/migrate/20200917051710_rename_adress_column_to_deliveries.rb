class RenameAdressColumnToDeliveries < ActiveRecord::Migration[5.2]
  def change
    rename_column :deliveries, :adress, :address
  end
end
