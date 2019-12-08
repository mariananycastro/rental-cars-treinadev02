class CarModel < ApplicationRecord

  validates :name, presence: true, case_sensitive: false
  validates :year, presence: true
  validates :manufacturer_id, presence: true 
  validates :fuel_type, presence: true, case_sensitive: false
  validates :motorization, presence: true 
  validates :car_category_id, presence: true 
  
  belongs_to :manufacturer
  #rails generate model car_model nome:string year:integer manufacturer:references fuel_type  motorization
  belongs_to :car_category
  #rails generate migration add_car_category_ref_to_car_model car_category:references
  has_many :car

  
  def car_model_name
    "#{name} #{year} #{motorization} #{fuel_type} #{car_category.name}"
  end


end
