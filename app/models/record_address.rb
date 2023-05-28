class RecordAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :area_id, :city, :address, :building, :telephone_number
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Number only 11 or 12 characters"}
    validates :item_id, :user_id, :city ,:address
  end
  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, address: address, building: building, telephone_number: telephone_number, record_id: record.id)
  end
end