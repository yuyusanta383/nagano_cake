class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :payment
      t.string :name
      t.string :postal_code
      t.string :address
      t.string :shipping
      t.integer :payment_method
      t.integer :status

      t.timestamps
    end
  end
end
