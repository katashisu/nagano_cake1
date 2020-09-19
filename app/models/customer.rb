class Customer < ApplicationRecord
  has_many :orders
  has_many :cart_items
  has_many :deliveries

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :email,uniqueness: true, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: 'が正しくありません。'}
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/, message: 'ハイフンなし7桁で入力してください。'}
  validates :address, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10,11}\z/, message: 'ハイフンなしで入力してください。'}

end
