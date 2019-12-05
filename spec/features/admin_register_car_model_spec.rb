require 'rails_helper'

feature 'Admin register car model' do
    scenario 'Successfully' do
        Manufacturer.create!(nome: 'Chevrolet')
        Manufacturer.create!(nome: 'Honda')
        CarCategory.create!(nome: 'A', daily_route: 100, car_insurance: 50, third_party_insurance: 90) 
        CarCategory.create!(nome: 'B', daily_route: 200, car_insurance: 100, third_party_insurance: 190)

        visit root_path
        click_on 'Modelos de Carro'
        click_on 'Cadastrar Novo Modelo'

        fill_in 'Nome', with: 'Onix'
        fill_in 'Ano', with: '2020'
        fill_in 'Motorização', with: '1.0'
        fill_in 'Combustivel', with: 'Flex'
        select 'Crevrolet', from: 'Fabricante'
        select 'A', from: 'Categoria'

        click_on 'Enviar'
        
        expect(page).to have_content('Modelo cadastrado com sucesso')
        expect(page).to have_content('Onix')
        expect(page).to have_content('Ano: 2020')
        expect(page).to have_content('1.0')
        expect(page).to have_content('Flex')
    end
end
     