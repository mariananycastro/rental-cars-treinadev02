require 'rails_helper'

feature 'Admin register cars' do
    scenario 'Successfully' do
        visit root_path
        click_on 'Carros'
        click_on 'Cadastrar Novo Carro'

        fill_in 'Nome', with: 'Gol'
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
      