class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.timestamps

      #追加のカラム
      t.integer :item_id
      t.integer :order_id
      t.integer :price
      t.integer :amount
    end
  end
end
