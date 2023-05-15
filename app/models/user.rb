class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, :first_name, :first_name_kana, :family_name, :family_name_kana, :birth_day, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :first_name
    validates :family_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/ } do
    validates :first_name_kana
    validates :family_name_kana
  end
end
