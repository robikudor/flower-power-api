class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.boolean :completed, default: false
      t.string :delivery_address

      t.timestamps
    end

    create_table :flower_orders do |t|
      t.integer :flower_id
      t.integer :order_id
    end
  end
end
