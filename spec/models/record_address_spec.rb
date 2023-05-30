require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
    end

    context '商品が購入できる場合' do
      it '必須項目を入力することで、購入することができる' do
        expect(@record_address).to be_valid
      end
      it '建物の情報が無くても、購入することができる' do
        @record_address.building = ''
        expect(@record_address).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it '郵便番号が空の時は購入できない' do
        @record_address.post_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンが含まれてない時は購入できない' do
        @record_address.post_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)") 
      end
      it '都道府県が選択されていない場合は購入できない' do
        @record_address.area_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が入力されていない場合は購入できない' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていない場合は購入できない' do
        @record_address.address = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank") 
      end
      it '電話番号が入力されていない場合は購入できない' do
        @record_address.telephone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号の入力が半角数字以外だった場合は購入できない' do
        @record_address.telephone_number = '090-1234-5678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Telephone number is invalid. Number only 11 or 12 characters")
      end
      it '電話番号の入力が12桁以上だった場合は購入できない' do
        @record_address.telephone_number = '090123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Telephone number is invalid. Number only 11 or 12 characters")
      end
      it '電話番号の入力が9桁以下だった場合は購入できない' do
        @record_address.telephone_number = '090123456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Telephone number is invalid. Number only 11 or 12 characters")
      end
      it 'tokenが空だった場合は購入できない' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end