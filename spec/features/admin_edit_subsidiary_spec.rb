require 'rails_helper'

feature 'Admin edits subsidiary' do
  scenario 'successfully' do
    Manufacturer.create(name: 'Unidade 1', cnpj:'000.0000.0000-10000', address: 'Rua A, 123' )

    visit root_path
    click_on 'Filial'
    click_on 'Unidade 1'
    click_on 'Editar'
    fill_in 'Nome', with: 'Unidade 2'
    fill_in 'CNPJ', with: '000.0000.0000-20000'
    fill_in 'Endereço', with: 'Rua B, 123'
    click_on 'Enviar'

    expect(page).to have_content('Unidade 2')
    expect(page).to have_content('000.0000.0000-20000')
    expect(page).to have_content('Rua B, 123')
    expect(page).to have_content('Filial atualizado com sucesso!')
  end

  scenario 'And must fill in all fields' do
    visit edit_subsidiary_path
    click_on 'Enviar'

    expect(page).to have_content('Você deve preencher todos os campos')
  end

  scenario 'and cnpj should not be equal to another subsidiary' do
    Manufacturer.create(name: 'Unidade 1', cnpj:'000.0000.0000-10000', address: 'Rua A, 123' )
    Manufacturer.create(name: 'Unidade 2', cnpj:'000.0000.0000-20000', address: 'Rua A, 123' )

    visit edit_subsidiary_path
    click_on 'Filial'
    click_on 'Unidade 1'
    click_on 'Editar'
    fill_in 'Nome', with: 'Unidade 3'
    fill_in 'CNPJ', with: '000.0000.0000-20000'
    fill_in 'Endereço', with: 'Rua B, 123'
    click_on 'Enviar'

    expect(page).to have_content('Filial já cadastrada!')
  end
end