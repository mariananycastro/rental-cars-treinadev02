class Manufacturer < ApplicationRecord
    validates :name, presence: true 
    validates :name, uniqueness: true
    # ou presence: {menssage: 'mensagem'}

    has_many :car_models
end
