class Address < ApplicationRecord
belongs_to :customer
def registered_addresses
    self.postal_code + " " + self.address + " " + self.name
end
end
