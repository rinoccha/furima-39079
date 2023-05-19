require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品内容の保存' do
    context '商品が出品できる場合' do
      it '必須項目を入力することで、出品保存することができる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品保存できない場合' do
      it '商品名が空の場合、出品保存できない' do
        @item.goods_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods name can't be blank")
      end
      it '商品説明が空の場合、出品保存できない' do
        @item.goods_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods explanation can't be blank")
      end
      it 'カテゴリーが---の場合、出品保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が---の場合、出品保存できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料が---の場合、出品保存できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it '発送元の地域が---の場合、出品保存できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数が---の場合、出品保存できない' do
        @item.ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship can't be blank")
      end
      it '販売価格が空の場合、出品保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300円以下の場合、出品保存できない' do
        @item.price = rand(1..299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price price outside the limits')
      end
      it '販売価格が10000000円以上の場合、出品保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price price outside the limits')
      end
      it '販売価格が全角の場合、出品保存できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price price outside the limits')
      end
      it '販売価格が数字以外が入力されている場合、出品保存できない' do
        @item.price = 'abc500'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price price outside the limits')
      end
      it '販売価格に小数点以下が入力されている場合、出品保存できない' do
        @item.price = '500.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it '商品画像が空の場合、出品保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐づいてない場合、出品保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
