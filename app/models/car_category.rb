class CarCategory < ApplicationRecord
    #rails generate model Car_category  
    validates :name, presence: true, uniqueness: true, case_sensitive: false
    validates :daily_rate, presence: true
    validates :car_insurance, presence: true
    validates :third_party_insurance, presence: true
    
    has_many :car_models
end
