class CarCategory < ApplicationRecord
    #rails generate model Car_category  
    has_many :cars, dependent: :destroy 
end
