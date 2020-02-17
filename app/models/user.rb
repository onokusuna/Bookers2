class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # userが親 bookが子
  has_many :books, dependent: :destroy
  # refileを使って、画像投稿ができるようにする _idを除いた名前（profile_image）を記述
  attachment :profile_image
end
