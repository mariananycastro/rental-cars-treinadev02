require 'rails_helper'

feature 'Admin edits subsidiary' do
  scenario 'successfully' do
    Subsidiary.create(name: 'Unidade 1', cnpj:'000.0000.0000-10000', address: 'Rua A, 123' )

    visit root_path
    click_on 'Filiais'
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
    Subsidiary.create(name: 'Unidade 1', cnpj:'000.0000.0000-10000', address: 'Rua A, 123' )
    

    visit root_path
    click_on 'Filiais'
    click_on 'Unidade 1'
    click_on 'Editar'
    fill_in 'Nome', with: ''

    click_on 'Enviar'

    expect(page).to have_content('Você deve corrigir todos os erros para prosseguir')
  end

  scenario 'and cnpj should not be equal to another subsidiary' do
    Subsidiary.create(name: 'Unidade 1', cnpj:'000.0000.0000-10000', address: 'Rua A, 123' )
    Subsidiary.create(name: 'Unidade 2', cnpj:'000.0000.0000-20000', address: 'Rua A, 123' )

    visit root_path
    click_on 'Filiais'
    click_on 'Unidade 1'
    click_on 'Editar'
    fill_in 'Nome', with: 'Unidade 3'
    fill_in 'CNPJ', with: '000.0000.0000-20000'
    fill_in 'Endereço', with: 'Rua B, 123'
    click_on 'Enviar'

    expect(page).to have_content('Você deve corrigir todos os erros para prosseguir')
  end
end