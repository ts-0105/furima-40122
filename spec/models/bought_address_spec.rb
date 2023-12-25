require 'rails_helper'

RSpec.describe BoughtAddress, type: :model do
  before do
    @bought_address = FactoryBot.build(:bought_address)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it 'post_num,region_id,city,street,building,phone_num,user_id,item_id,tokenが存在すれば登録できる' do
        expect(@bought_address).to be_valid
      end
    end

    context '出品できない場合' do
      it 'post_numが空では登録できない' do
        @bought_address.post_num = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Post num can't be blank",
                                                                'Post num is invalid. Include hyphen(-)'
      end
      it 'post_numが「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @bought_address.post_num = '1234567'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include 'Post num is invalid. Include hyphen(-)'
      end
      it 'region_idが空だとできな保存できない' do
        @bought_address.region_id = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Region can't be blank", "Region can't be blank"
      end
      it 'cityが空だとできな保存できない' do
        @bought_address.city = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "City can't be blank"
      end
      it 'streetが空だとできな保存できない' do
        @bought_address.street = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Street can't be blank"
      end
      it 'buildingが空だとできな保存できない' do
        @bought_address.building = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Building can't be blank"
      end
      it 'phone_numが空だとできな保存できない' do
        @bought_address.phone_num = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Phone num can't be blank"
      end
      it 'phone_numが10桁以上11桁以内の半角数値以外の値では保存できない' do
        @bought_address.phone_num = '090-1234-5678'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include
      end
      it 'user_idが空だとできな保存できない' do
        @bought_address.user_id = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空だとできな保存できない' do
        @bought_address.item_id = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空だとできな保存できない' do
        @bought_address.token = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
