class Item < ApplicationRecord

	belongs_to :genre
	has_many :cart_items
	has_many :order_items

	attachment :image #refileの記述

	#必ず記入させる
	validates :name, presence: true
	validates :introduction, presence: true, length: {maximum:160}
	validates :genre_id, presence: true
	validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 100} #100以上の整数指定
	validates :is_active, inclusion: { in: [true, false]}
end
