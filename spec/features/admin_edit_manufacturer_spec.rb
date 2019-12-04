require 'rails_helper'

feature 'Admin edits manufacturer' do
  scenario 'successfully' do
    Manufacturer.create(name: 'Fiat')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    #neste item ele vai para a view=show
    click_on 'Editar'
    fill_in 'Nome', with: 'Honda'
    click_on 'Enviar'

    expect(page).to have_content('Honda')
    expect(page).to have_content('Fabricante atualizado com sucesso!')
  end

  scenario 'And must fill in all fields' do
    visit new_manufacturer_path
    fill_in 'Nome', with: ''
    #podia nao ter colocado a linha de cima, pq eu enviaria um formulario vazio
    click_on 'Enviar'
    #manufacturer.valid?
    #manufacurer.errors

    expect(page).to have_content('Você deve preencher todos os campos')
  end
  
  scenario 'and_name_must_be_unique' do
    Manufacturer.create(name: 'Fiat')

    visit new_manufacturer_path
    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'
    expect(page).to have_content('Fabricante já cadastrado')
  end

  scenario 'and must fill in all fields' do
    Manufacturer.create!(name: 'Fiat')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'
    expect(page).to have_content('Você deve preencher todos os campos') 
  end

  scenario 'and_name_must_be_unique' do
    Manufacturer.create(name: 'Fiat')
    Manufacturer.create(name: 'Honda')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: 'Honda'
    click_on 'Enviar'
    expect(page).to have_content('Fabricante já cadastrado') 
  end

end