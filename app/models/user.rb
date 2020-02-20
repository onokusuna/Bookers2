class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # ユーザー名を制限
  validates :name, presence: true, uniqueness: true,# 同じ行なので,忘れない！
            length: { minimum: 2, maximum: 20 }

  validates :introduction, length: { maximum: 20 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # userが親 bookが子
  has_many :books, dependent: :destroy
  # refileを使って、画像投稿ができるようにする _idを除いた名前（profile_image）を記述
  attachment :profile_image
end
