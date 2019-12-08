class Car < ApplicationRecord
    validates :car_model_id, presence:true
    validates :subsidiary_id, presence:true
    validates :licence_plate, presence:true, uniqueness:true
    validates :color, presence:true
    validates :mileage, presence:true

    belongs_to :car_model
    belongs_to :subsidiary

    def car_model_name
        if car_model
            "#{car_model.name} #{car_model.year} #{car_model.motorization} #{car_model.fuel_type} #{car_model.car_category.name}"
        else
            'não tem modelo'
        end
    end


end
