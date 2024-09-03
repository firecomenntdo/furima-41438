require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'すべての値が正しく入力されていれば登録できる' do
        @user.password = 'test1234'
        @user.password_confirmation = 'test1234'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.email = 'aaaa@aaaa'
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = 'aaaa@aaaa'
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aiueoka'
        @user.password_confirmation = 'aiueoka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字を含めてください')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字を含めてください')
      end
      it 'lastnameが空だと登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname can't be blank"
      end
      it 'firstnameが空だと登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname can't be blank"
      end
      it 'lastname_kanaが空だと登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Lastname kana can't be blank"
      end
      it 'firstname_kanaが空だと登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname kana can't be blank"
      end
      it 'lastname_kanaがカタカナ以外だと登録できない' do
        @user.lastname_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Lastname kana は全角カタカナで入力してください'
      end
      it 'firstname_kanaがカタカナ以外だと登録できない' do
        @user.firstname_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Firstname kana は全角カタカナで入力してください'
      end
      it 'birthが空だと登録できない' do
      end
    end
  end
end
