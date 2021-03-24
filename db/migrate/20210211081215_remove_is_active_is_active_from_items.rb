class RemoveIsActiveIsActiveFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :is_active, :boolean
  end
end
