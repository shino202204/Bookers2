class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Active Storageを使って画像を扱えるようにする
  has_one_attached :image

  # アソシエーションの設定
  has_many :books, dependent: :destroy
end
