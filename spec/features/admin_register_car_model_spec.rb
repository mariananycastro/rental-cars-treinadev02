require 'rails_helper'

feature 'Admin register car model' do
    scenario 'Successfully' do
        Manufacturer.create!(name: 'Chevrolet')
        Manufacturer.create!(name: 'Honda')
        CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 50, third_party_insurance: 90) 
        CarCategory.create!(name: 'B', daily_rate: 200, car_insurance: 100, third_party_insurance: 190)

        visit root_path
        click_on 'Modelo de Carros'
        click_on 'Cadastrar Novo Modelo de Carro'

        fill_in 'Nome', with: 'Onix'
        fill_in 'Ano', with: '2020'
        fill_in 'Motorização', with: '1.0'
        fill_in 'Combustivel', with: 'Flex'
        have_select 'Crevrolet', from: 'Fabricante'
        have_select 'A', from: 'Categoria'

        click_on 'Enviar'
        
        expect(page).to have_content('Modelo registrado com sucesso')
        expect(page).to have_content('Onix')
        expect(page).to have_content('2020')
        expect(page).to have_content('1.0')
        expect(page).to have_content('Flex')
    end
end
     