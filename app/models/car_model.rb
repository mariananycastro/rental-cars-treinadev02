class CarModel < ApplicationRecord

  
  belongs_to :manufacturer
  #rails generate model car_model nome:string year:integer manufacturer:references fuel_type  motorization
  belongs_to :car_category
  #rails generate migration add_car_category_ref_to_car_model car_category:references
  
end
