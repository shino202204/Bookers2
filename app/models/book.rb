class Book < ApplicationRecord
  # アソシエーションの設定
  belongs_to :user

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
