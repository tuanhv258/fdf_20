class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :category_id
      t.float :price
      t.string :description
      t.string :image
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
