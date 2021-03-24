class Item < ApplicationRecord
 has_many :cart_items
 belongs_to :genre
 has_many :order_history_datails
 attachment :image
  enum is_active: {販売中: true, 販売停止:false} 
 
  validates :name, :introduction, :price,  presence: true
end
