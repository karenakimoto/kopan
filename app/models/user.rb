class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes

  with_options presence: true do
    validates :name
    validates :email
    validates :password, format:{ with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,10}+\z/i }
  end
end
