class Delivery < ApplicationRecord
  belongs_to :customer

  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/, message: 'ハイフンなし7桁で入力してください。'}
  validates :address, presence: true
  validates :name, presence: true
end
