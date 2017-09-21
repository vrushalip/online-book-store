class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :itemable_id
      t.string :itemable_type
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.integer :product_id
      t.timestamps null: false
    end
  end
end
