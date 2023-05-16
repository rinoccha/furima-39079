class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  entend ActiveHash::Associations::ActiveRecordExtensions
  belongs to :category, :condition, :charge, :area, :shipping_day

  validates :goods_name, :goods_explanation, presence: true

  validates :category_id, :condition_id, :charge_id, :area_id, :shipping_day_id,
   numericality: { other_than: 1 , message: "can't be blank" }

  with_options presence: true, format:{  with:/\A[0-9]+\z/} do
    validates :price
  end

end
