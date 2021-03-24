class AddIsActiveToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :is_active, :boolean
  end
end
