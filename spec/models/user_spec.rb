require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it 'nicknameが空では登録できない' do  
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end

    it 'emailが空では登録できない' do #一意性、＠含む
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it '重複したemailが存在する場合は登録できない' do
  @user.save
  another_user = FactoryBot.build(:user)
  another_user.email = @user.email
  another_user.valid?
  expect(another_user.errors.full_messages).to include('Email has already been taken')
end

it 'emailは@を含まないと登録できない' do
  @user.email = 'testmail'
  @user.valid?
  expect(@user.errors.full_messages).to include('Email is invalid')
end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが5文字以下では登録できない' do
  @user.password = '00000'
  @user.password_confirmation = '00000'
  @user.valid?
  expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
end

    it 'passwordとpassword_confirmationが不一致では登録できない、6文字未満でも登録できない' do
  @user.password = '123456'
  @user.password_confirmation = '1234567'
  @user.valid?
  expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
end

    it 'lastnameが空では登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname can't be blank"
    end

    it 'firstnameが空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname can't be blank"
    end

    it 'lastname_kanaが空では登録できない' do #カタカナ
      @user.lastname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Lastname kana can't be blank"
    end

    it 'firstname_kanaが空では登録できない' do #カタカナ
      @user.firstname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
    end

    it 'birthdayが空では登録できない' do #カタカナ
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end



  end

end