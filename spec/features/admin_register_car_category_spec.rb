require 'rails_helper'

feature 'Admin register car category' do
    scenario 'Successfully' do
        user = User.create!(email: 'test@test.com', password: '123456')
        
        login_as(user, role: :admin)
        
        visit root_path
        click_on 'Categorias'
        click_on 'Criar nova Categoria'

        fill_in 'Nome', with: 'Auto'
        fill_in 'Valor Diária:', with: '1'
        fill_in 'Seguro do Carro:', with: '2'
        fill_in 'Seguro contra terceiros:', with: '3'
        click_on 'Enviar'
        
        expect(page).to have_content('Auto')
        expect(page).to have_content('1')
        expect(page).to have_content('2')
        expect(page).to have_content('3')
    end
end
     