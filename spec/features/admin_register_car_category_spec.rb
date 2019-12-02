require 'rails_helper'

feature 'Admin register car category' do
    scenario 'Successfully' do
        visit root_path
        click_on 'Categorias'
        click_on 'Cadastrar Nova Categoria'

        fill_in 'Nome', with: 'Auto'
        fill_in 'Daily Rate', with: '0,1'
        fill_in 'Car insurance', with: '0,2'
        fill_in 'Third party insurance', with: '0,3'
        click_on 'Enviar'
        
        expect(page).to have_content('Auto')
        expect(page).to have_content('0,1')
        expect(page).to have_content('0,2')
        expect(page).to have_content('0,3')
    end
end
     