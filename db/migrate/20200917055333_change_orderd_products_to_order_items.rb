class ChangeOrderdProductsToOrderItems < ActiveRecord::Migration[5.2]
  def change
    rename_table :orderd_products, :order_items
  end
end
