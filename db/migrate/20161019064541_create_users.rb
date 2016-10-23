class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :date_of_birth
      t.string :address
      t.string :phone_number
      t.integer :role, default: 1

      t.timestamps null: false
    end
  end
end
