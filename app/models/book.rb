class Book < ApplicationRecord
	# userが親 bookが子
	belongs_to :user

	validates :title, presence: true,# presence=存在
		length: { maximum: 200 }
	validates :body, presence: true,# presence=存在
		length: { maximum: 200 }
end
