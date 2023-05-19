class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :ship

  validates :goods_name, :goods_explanation, :image, presence: true

  validates :category_id, :condition_id, :charge_id, :area_id, :ship_id,
            numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price
  end

  validates_inclusion_of :price, in: 300..9_999_999, message: 'price outside the limits'
end
