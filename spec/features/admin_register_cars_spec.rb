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
        have_select 'VW', from: 'Fabricante:'
        have_select '', from: 'Fabricante:'
        fill_in '', with: 'Gol'

   #     validates :name, presence:true
   # validates :car_model_id, presence:true
   # validates :subsidiary_id, presence:true
   # validates :licence_plate, presence:true
   # validates :color, presence:true
   # validates :mileage, presence:true
        #fill_in 'Daily Rate', with: '0,1'
        #fill_in 'Car insurance', with: '0,2'
        #fill_in 'Third party insurance', with: '0,3'
        click_on 'Enviar'
        
        expect(page).to have_content('Gol')
        #expect(page).to have_content('0,1')
        #expect(page).to have_content('0,2')
        #expect(page).to have_content('0,3')
    end
end
Manufacturer.create!(name: 'Chevrolet')
CarCategory.create!(name: 'B', daily_rate: 200, car_insurance: 100, third_party_insurance: 190)