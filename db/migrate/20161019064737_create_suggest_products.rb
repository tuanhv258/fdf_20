class CreateSuggestProducts < ActiveRecord::Migration
  def change
    create_table :suggest_products do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :product_name
      t.string :product_des
      t.float :product_price
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
