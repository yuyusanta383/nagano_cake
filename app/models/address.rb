class Address < ApplicationRecord
belongs_to :customer
validates :postal_code, :address, :name, presence: true
def registered_addresses
    self.postal_code + " " + self.address + " " + self.name
end
end
