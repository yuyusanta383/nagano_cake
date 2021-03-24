class RemoveAuthorFromCustomers < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :street_address, :string
  end
end
