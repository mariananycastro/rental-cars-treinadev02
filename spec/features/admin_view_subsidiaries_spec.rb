require 'rails_helper'

feature 'Admin view subsidiaries' do
    scenario 'successfully' do
        Subsidiary.create!(name: 'Filial1', cnpj: '00.000.000/0001-00', address: 'Rua: A, 123')
        user = User.create!(email: 'test@test.com', password: '123456', role: :admin)
        
        login_as(user)

        visit root_path
        click_on 'Filiais'
        click_on 'Filial1'
        
        expect(page).to have_content('Filial1')
        expect(page).to have_content('00.000.000/0001-00')
        expect(page).to have_content('Rua: A, 123')
        # poderia ser .not_to ou to_not
        # have_content = have_ccss, have_text, have_link

    end
end
