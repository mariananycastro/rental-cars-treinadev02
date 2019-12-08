class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable(ex:facebook, google, github)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:employee, :admin]
  #enum role: { employee: 0, admin: 10 }, p eu colocar varias classes dentro de employee
  #ganho os metodos
  #user.admin! - cria um admi
  #user.employee? - eh employee
end
