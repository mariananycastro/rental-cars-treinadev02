class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable(ex:facebook, google, github)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
