require 'rails_helper'

feature 'User search rental' do
    scenario 'Successfully' do
        user = User.create!(email: 'maria@teste.com', password: '123456', role: :employee)
        client = Client.create!(name: 'Maria', cpf: '743.341.870-99', email: 'mari@teste.com')
        category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 200, third_party_insurance:100)
        rental = Rental.create!(client: client, car_category: category, start_date: 1.day.from_now, 
                                end_date: 2.days.from_now, reservation_code: 'ABC123456')
        other_rental = Rental.create!(client: client, car_category: category, start_date: 1.day.from_now, 
                                        end_date: 2.days.from_now, reservation_code: 'AAA1234')
        
        login_as(user, scope: :user)
        visit root_path
        click_on 'Locações'
        fill_in 'Código', with: rental.reservation_code
        click_on 'Buscar'

        expect(page).to have_content(rental.reservation_code)
        expect(page).not_to have_content(other_rental.reservation_code)

    end
end