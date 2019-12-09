require 'rails_helper'

feature 'Admin register subsidiary' do
    scenario 'Successfully' do
        user = User.create!(email: 'test@test.com', password: '123456')
        
        login_as(user, role: :admin)

        visit root_path
        click_on 'Filiais'
        click_on 'Cadastrar Nova Filial'

        fill_in 'Nome', with: 'São Paulo'
        fill_in 'CNPJ', with: '00.000.000/0001-00'
        fill_in 'Endereço', with: 'Rua: A, 123'
        click_on 'Enviar'
        
        expect(page).to have_content('São Paulo')
        expect(page).to have_content('00.000.000/0001-00')
        expect(page).to have_content('Rua: A, 123')
    end
end