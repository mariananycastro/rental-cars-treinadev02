class Manufacturer < ApplicationRecord
    validates :name, presence: true 
    validates :name, uniqueness: {message: 'Fabricante já cadastrado'}
    # ou presence: {menssage: 'mensagem'}
end
