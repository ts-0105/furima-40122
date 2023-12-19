require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it 'image,name,text,category_id,condition_id,load_id,region_id,delivery_date_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'load_idが空では登録できない' do
        @item.load_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Load can't be blank"
      end
      it 'region_idが空では登録できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end
      it 'delivery_date_idが空では登録できない' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが¥300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it 'priceが¥9,999,999より高いと登録できない' do
        @item.price = 12_345_678
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end

      it 'priceは半角数値以外登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
    end
  end
end
