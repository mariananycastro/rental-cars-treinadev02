require 'rails_helper'

feature 'User schedule rental' do
    scenario 'successfully' do
        user = User.create!(email: 'teste@teste.com' , password: '123456', role: :employee)
        client = Client.create!(name: 'Maria', cpf: '743.341.870-99', email: 'maria@teste.com')
        category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 200, third_party_insurance: 200)

        login_as(user, scope: :user)

        visit root_path
        click_on 'Locações'
        click_on 'Agendar Locação'
        fill_in 'Data de Inicio:', with: '09/12/2019'
        fill_in 'Data de Termino:', with: '13/12/2019'
        select '#{client.name} #{cliente.cpf}', from: 'Cliente'
        # ou nao cria a variavel cliente e no select coloca 'Maria 743.341.870-99'
        select category.name, from: 'Categoria'
        click_on 'Enviar'
        
        expect(page).to have_content('Locação agendada com sucesso!')
        expect(page).to have_content('09/12/2019')
        expect(page).to have_content('13/12/2019')
        expect(page).to have_content(client.name)
        expect(page).to have_content(client.document)
        expect(page).to have_content('Categoria')
        expect(page).to have_content('category.name')
    end 

end