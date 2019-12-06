require 'rails_helper'

feature 'Admin edits manufacturer' do
  scenario 'successfully' do
    #arrange
    user = User.create!(email: 'test@test.com', password: '123456')

    
    Manufacturer.create(name: 'Fiat')
    #act
    login_as(user, scope: :user)
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    #neste item ele vai para a view=show
    click_on 'Editar'
    fill_in 'Nome', with: 'Honda'
    click_on 'Enviar'
    #assert
    expect(page).to have_content('Honda')
    expect(page).to have_content('Fabricante atualizado com sucesso!')
  end

  scenario 'And must fill in all fields' do
    user = User.create!(email: 'test@test.com', password: '123456')

    login_as(user, scope: :user)
    visit new_manufacturer_path
    fill_in 'Nome', with: ''
    #podia nao ter colocado a linha de cima, pq eu enviaria um formulario vazio
    click_on 'Enviar'
    #manufacturer.valid?
    #manufacurer.errors

    expect(page).to have_content('Você deve corrigir todos os erros para prossegui')
  end
  
  scenario 'and_name_must_be_unique' do
    user = User.create!(email: 'test@test.com', password: '123456')

    login_as(user, scope: :user)
    Manufacturer.create(name: 'Fiat')

    visit new_manufacturer_path
    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'
    expect(page).to have_content('Você deve corrigir todos os erros para prossegui')
  end

  scenario 'and must fill in all fields' do
    user = User.create!(email: 'test@test.com', password: '123456')

    login_as(user, scope: :user)
    Manufacturer.create!(name: 'Fiat')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'
    expect(page).to have_content('Você deve corrigir todos os erros para prossegui') 
  end

  scenario 'and_name_must_be_unique' do
    user = User.create!(email: 'test@test.com', password: '123456')

    login_as(user, scope: :user)
    Manufacturer.create(name: 'Fiat')
    Manufacturer.create(name: 'Honda')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: 'Honda'
    click_on 'Enviar'
    expect(page).to have_content('Você deve corrigir todos os erros para prossegui') 
  end

end