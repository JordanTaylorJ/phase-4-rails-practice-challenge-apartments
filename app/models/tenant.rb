class Tenant < ApplicationRecord
    has_many :leases 
    has_many :apartments, through: :leases 

    validates :name, presence: true
    #validates :age, length: { minimum: 18 }

    scope :four_char, -> {where ("LENGTH(name) > 4")}
end
