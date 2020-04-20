class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books #1:Nの関係になるモデル名を複数形で記述

  validates :name, length: { in: 2..20 }, presence: true  #Userモデルのユーザー名は2〜20文字までに

end
