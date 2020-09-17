class CreateOrderdProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :orderd_products do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :buying_price
      t.integer :amount
      t.integer :making_status

      t.timestamps
    end
  end
end
