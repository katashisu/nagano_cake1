class Genre < ApplicationRecord
	validates :name, presence: true
	has_many :items, foreign_key: :genre_id
end
