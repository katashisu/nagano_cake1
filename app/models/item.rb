class Item < ApplicationRecord

	belongs_to :genre
	has_many :cart_items
	has_many :order_items

	attachment :image #refileの記述

	#画像以外は必ず記入させる
	validates :name, presence: true
	validates :introduction, presence: true
	validates :genre_id, presence: true
	validates :price, presence: true
	validates :is_active, inclusion: { in: [true, false]}
end
