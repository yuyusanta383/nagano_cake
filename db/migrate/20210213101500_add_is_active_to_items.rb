class AddIsActiveToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :is_active, :boolean
  end
end
