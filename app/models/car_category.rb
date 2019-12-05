class CarCategory < ApplicationRecord
    #rails generate model Car_category  
    
    has_many :car_models
end
