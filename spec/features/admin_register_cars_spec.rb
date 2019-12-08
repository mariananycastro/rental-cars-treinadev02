require 'rails_helper'

feature 'Admin new register car' do
    scenario 'Successfully' do
        Manufacturer.create!(name: 'VW')
        CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 50, third_party_insurance: 90) 
        CarModel.create(name: 'Gol', year: '2019', manufacturer_id: 'VW', fuel_type: 'Alcool', motorization:'2.0', 
                        car_category_id:'A')
        Subsidiary.create(name: 'Unidade 2', cnpj:'000.0000.0000-20000', address: 'Rua A, 123' )

        visit root_path
        click_on 'Carros'
        click_on 'Cadastrar Novo Carro'
        
        have_select 'VW', from: 'Fabricante:'
        have_select 'Unidade 2', from: 'Fabricante:'
        fill_in 'Placa:', with: 'ABD1234'
        fill_in 'Cor:', with: 'Azul'
        fill_in 'Kilometragem:', with: '0'

        click_on 'Enviar'
        
        expect(page).to have_content('Gol')
        expect(page).to have_content('Unidade 2')
        expect(page).to have_content('ABD1234')
        expect(page).to have_content('Azul')
        expect(page).to have_content('0')
    end
end
Manufacturer.create!(name: 'Chevrolet')
CarCategory.create!(name: 'B', daily_rate: 200, car_insurance: 100, third_party_insurance: 190)