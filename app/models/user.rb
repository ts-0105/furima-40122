class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true

  validates :email, presence: true, unique: true

  validates :password, presence: true, length: { minimum: 6 }
  
  with_options presence: true, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}a-zA-Z]+\z/, message: "は漢字、ひらがな、カタカナ、英語のみを含めることができます" } do
  validates :lastname
  validates :firstname
        end

  with_options presence: true, format: { with: /\A[\p{Katakana}ー－]+\z/, message: "はカタカナのみを含めることができます" } do
  validates :lastname_kana, presence: true
  validates :firstname_kana, presence: true
        end

  validates :birthday, presence: true

end
