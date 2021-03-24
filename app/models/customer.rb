class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_many :addresses
 has_many :cart_items
 has_many :orders
 enum is_deleted: { 有効: false, 退会: true }
def name
  [first_name, last_name].join('')
end

def kana_name
  [first_name_kana, last_name_kana].join('')
end

end
