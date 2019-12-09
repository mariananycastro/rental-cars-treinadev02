require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456')
    login_as(user, role: :admin)
    
    visit root_path

    expect(page).to have_content('Rental Cars')
    expect(page).to have_content('Bem vindo ao sistema de gestão de locações')
  end
end