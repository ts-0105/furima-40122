require 'rails_helper'

RSpec.describe BoughtAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @bought_address = FactoryBot.build(:bought_address)
    @bought_address.user_id = @user.id
    @bought_address.item_id = @item.id
  end

  describe '商品購入' do
    context '購入できる場合' do
      it 'post_num,region_id,city,street,building,phone_num,user_id,item_id,tokenが存在すれば登録できる' do
        expect(@bought_address).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @bought_address.building = ''
        expect(@bought_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post_numが空では購入できない' do
        @bought_address.post_num = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Post num can't be blank",
                                                                'Post num is invalid. Include hyphen(-)'
      end
      it 'post_numが「3桁ハイフン4桁」の半角文字列のみ購入可能なこと' do
        @bought_address.post_num = '1234567'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include 'Post num is invalid. Include hyphen(-)'
      end
      it 'region_idが空だとできな購入できない' do
        @bought_address.region_id = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Region can't be blank", "Region can't be blank"
      end
      it 'region_idが1だとできな購入できない' do
        @bought_address.region_id = 1
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Region can't be blank"
      end
      it 'cityが空だとできな購入できない' do
        @bought_address.city = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "City can't be blank"
      end
      it 'streetが空だとできな購入できない' do
        @bought_address.street = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Street can't be blank"
      end
      it 'phone_numが空だとできな購入できない' do
        @bought_address.phone_num = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Phone num can't be blank"
      end
      it 'phone_numが9桁以下では購入できない' do
        @bought_address.phone_num = '090123456'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include 'Phone num is invalid'
      end
      it 'phone_numが12桁以上では購入できない' do
        @bought_address.phone_num = '090123456789'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include 'Phone num is invalid'
      end
      it 'phone_numが半角数値以外の値では購入できない' do
        @bought_address.phone_num = '090-1234-5678'
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include 'Phone num is invalid'
      end
      it 'user_idが空だとできな購入できない' do
        @bought_address.user_id = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空だとできな購入できない' do
        @bought_address.item_id = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空だとできな購入できない' do
        @bought_address.token = ''
        @bought_address.valid?
        expect(@bought_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
