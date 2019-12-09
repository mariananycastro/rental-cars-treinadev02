require 'rails_helper'

feature 'User sign in ' do
    scenario 'successfully' do
        user = User.create!(email: 'teste@test.com', password: '123456')
        
        visit root_path
        click_on 'Entrar'
        fill_in 'Email', with: user.email
        fill_in 'Senha', with: user.password
        click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Signed in successfully.')
    #frase padrao em confi locals devise.en.yml
    expect(page).to have_link('Sair')
    expect(page).not_to have_link('Entrar')

    end

    scenario 'And log out' do
        user = User.create!(email: 'teste@test.com', password: '123456')

        visit root_path
        click_on 'Entrar'
        fill_in 'Email', with: user.email
        fill_in 'Senha', with: user.password
        click_on 'Log In'
        click_on 'Sair'

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    #frase padrao em confi locals devise.en.yml
    expect(page).to have_link('Entrar')
    expect(page).not_to have_link('Sair')

    end


end