class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_name
      t.integer :user_id
      t.integer :status
      t.float :total_money

      t.timestamps null: false
    end
  end
end
