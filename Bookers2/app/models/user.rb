class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books #1:Nの関係になるモデル名を複数形で記述
  has_many :post_images, dependent: :destroy #画像を投稿post_imagesと関連づける
  attachment :profile_image #refileを使って画像投稿できるようにする
  #mount_uploader :image, ImageUploader　#画像up

  validates :name, length: { in: 2..20 }, presence: true  #Userモデルのユーザー名は2〜20文字までに

end
