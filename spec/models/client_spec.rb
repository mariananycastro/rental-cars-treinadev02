require 'rails_helper'

#RSpec.describe Client, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
#end

describe Client do
  #não coloco o tipo pq já estou na pasta correta
  #teste unitario, pq eu testo apenas um methodo
  context '.description' do
  # context = scenario
  # qdo eh um teste de classe eu colocaria #description, como é um teste de objeto eu coloco .description
    it 'must return name with doccument' do
      client = Client.new(name: 'Maria', cpf: '743.341.870-99', email: 'mari@teste.com')

      expect(client.description).to eq 'Maria - 743.341.870-99'

      #para chamar o metodo description o cliente nao precisa estar no banco de dados, pq eu nao preciso do id
      #por isso eu dou um new, que não salva no banco e é mais rapido que o create.
    end
  end

end
