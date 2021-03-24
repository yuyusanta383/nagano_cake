class Order < ApplicationRecord
belongs_to :customer
has_many :order_history_details
enum payment_method: ['銀行振込', 'クレジットカード']
enum status:  {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
validates :name, presence: true
validates :address, presence: true
validates :postal_code, presence: true

end
