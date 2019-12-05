class Subsidiary < ApplicationRecord
    validates :name, presence: true
    validates :cnpj, presence: true, uniqueness: true
    validates :address, presence: true

    has_many :cars
end
