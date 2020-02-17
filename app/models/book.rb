class Book < ApplicationRecord
	# userが親 bookが子
	belongs_to :user
end
