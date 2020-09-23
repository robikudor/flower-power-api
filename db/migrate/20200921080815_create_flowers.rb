class CreateFlowers < ActiveRecord::Migration[6.0]
  def change
    create_table :flowers do |t|
      t.string :name
      t.string :description
      t.string :image

      # filtering
      t.integer :price
      t.integer :color
      t.integer :occasion
      t.integer :form
      t.integer :ordered_count, default: 0

      t.timestamps
    end
  end
end
