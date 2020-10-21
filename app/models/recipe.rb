class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :breadtype
  has_many :comments, foreign_key: "recipe_id", dependent: :destroy

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :bread, length: { maximum: 40 }
    validates :breadtype_id, numericality: { other_than: 1 }
    validates :material
    validates :recipe, length: { maximum: 200 }
  end
end
