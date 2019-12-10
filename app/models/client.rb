class Client < ApplicationRecord

    validates :email, presence: { message: 'não pode ficar em branco' }, uniqueness: true
    validates :name, presence: { message: 'Nome não pode ficar em branco' }
    validates :cpf, presence: { message: 'CPF não pode ficar em branco' }, uniqueness: true
    
    def description  
      "#{name} - #{cpf}"
    end
end
