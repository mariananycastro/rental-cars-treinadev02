require 'rails_helper'

feature 'Admin register new car model' do
  scenario 'successfully' do
    CarCategory.create!(name: 'A', daily_rate: 200, car_insurance: 300, third_party_insurance: 400)
    Manufacturer.create!(name: 'VW')

    visit root_path
    click_on 'Modelo de Carros'
    click_on 'Cadastrar Novo Modelo de Carro'

    fill_in 'Nome', with: 'Gol'
    fill_in 'Ano', with: '2019'
    have_select 'VW', from: 'Fabricante:'
    fill_in 'Combustivel', with: 'Alcool'
    fill_in 'Motorização', with: '2.0'
    have_select 'A', from: 'Categoria:'
    click_on 'Enviar'
   
    expect(page).to have_content('Gol')
    expect(page).to have_content('2019')
    expect(page).to have_content('VW')
    expect(page).to have_content('Alcool')
    expect(page).to have_content('2.0')
    expect(page).to have_content('A')
    

    expect(page).to have_content('Modelo registrado com sucesso')
  end

  scenario 'And must fill in all fields' do
    visit new_car_model_path
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve corrigir todos os erros para prosseguir')
  end
  
  scenario 'and Update' do
    CarModel.create(name: 'Gol', year: '2019', manufacturer_id: 'VW', fuel_type: 'Alcool', motorization:'2.0', 
                    car_category_id:'A')
    CarCategory.create(name: 'A', daily_rate: 200, car_insurance: 300, third_party_insurance: 400)
    Manufacturer.create(name: 'VW')

    visit root_path
    click_on 'Modelo de Carros'
    click_on 'Gol'
    click_on 'Editar'

    fill_in 'Nome', with: 'Gol'
    fill_in 'Ano', with: '2019'
    have_select 'VW', from: 'Fabricante:'
    fill_in 'Combustivel', with: 'Alcool'
    fill_in 'Motorização', with: '3.0'
    have_select 'A', from: 'Categoria:'
    click_on 'Enviar'
  
    expect(page).to have_content('Modelo atualizada com sucesso!') 
  end

  scenario 'update and must fill in all fields ' do
    CarModel.create(name: 'Gol', year: '2019', manufacturer_id: 'VW', fuel_type: 'Alcool', motorization:'2.0', 
                    car_category_id:'A')
    CarCategory.create(name: 'A', daily_rate: 200, car_insurance: 300, third_party_insurance: 400)
    Manufacturer.create(name: 'VW')

    visit root_path
    click_on 'Modelo de Carros'
    click_on 'Gol'
    click_on 'Editar'
    fill_in 'Year:', with: ''
    click_on 'Enviar'
    expect(page).to have_content('Você deve corrigir todos os erros para prosseguir') 
  end
end