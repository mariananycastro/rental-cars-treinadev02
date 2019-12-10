require 'rails_helper'

feature 'Admin register new car category' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)
    
    login_as(user, scope: :user)
    visit root_path
    click_on 'Categorias'
    click_on 'Criar nova Categoria'

    fill_in 'Nome', with: 'A'
    fill_in 'Valor Diária', with: '200'
    fill_in 'Seguro do Carro:', with: '300'
    fill_in 'Seguro contra terceiros:', with: '400'
    
    click_on 'Enviar'

    expect(page).to have_content('Categoria A')
    expect(page).to have_content('200')
    expect(page).to have_content('300')
    expect(page).to have_content('400')

    expect(page).to have_content('Categoria Cadastrada com sucesso!')
  end

  scenario 'And must fill in all fields' do
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)
    
    login_as(user, scope: :user)
    visit new_car_category_path
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve corrigir todos os erros para prosseguir')
  end
  
  scenario 'and_name_must_be_unique' do
    CarCategory.create(name: 'A', daily_rate: 200, car_insurance: 300, third_party_insurance: 400)
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)
    
    login_as(user, scope: :user)

    visit new_car_category_path
    fill_in 'Nome', with: 'A'
    fill_in 'Valor Diária', with: '300'
    fill_in 'Seguro do Carro:', with: '200'
    fill_in 'Seguro contra terceiros:', with: '400'
    click_on 'Enviar'

    expect(page).to have_content('Você deve corrigir todos os erros para prosseguir')
  end

  scenario 'and Update' do
    CarCategory.create(name: 'A', daily_rate: 200, car_insurance: 300, third_party_insurance: 400)
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)
    
    login_as(user, scope: :user)

    visit root_path
    click_on 'Categorias'
    click_on 'A'
    click_on 'Editar'
    fill_in 'Valor Diária:', with: '100'
    click_on 'Enviar'
    expect(page).to have_content('Categoria atualizada com sucesso!') 
  end

  scenario 'update and must fill in all fields ' do
    CarCategory.create(name: 'A', daily_rate: 200, car_insurance: 300, third_party_insurance: 400)
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)
    
    login_as(user, scope: :user)

    visit root_path
    click_on 'Categorias'
    click_on 'A'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'
    expect(page).to have_content('Você deve corrigir todos os erros para prosseguir') 
  end

  scenario 'update and name must be unique' do
    CarCategory.create(name: 'A', daily_rate: 200, car_insurance: 300, third_party_insurance: 400)
    CarCategory.create(name: 'B', daily_rate: 100, car_insurance: 400, third_party_insurance: 200)
    user = User.create!(email: 'test@test.com', password: '123456', role: :admin)
    
    login_as(user, scope: :user)

    visit root_path
    click_on 'Categorias'
    click_on 'A'
    click_on 'Editar'
    fill_in 'Nome', with: 'B'
    click_on 'Enviar'

    expect(page).to have_content('Você deve corrigir todos os erros para prosseguir') 
  end

end