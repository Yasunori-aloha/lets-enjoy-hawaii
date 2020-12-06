# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:another_user) { build(:user) }

  describe 'ユーザー新規登録' do
    context 'ユーザーの新規登録ができる場合' do
      it 'name・email・passwordが正しく入力されていれば登録できる' do
        expect(user).to be_valid
      end

      it 'introduceが入力されていなくても登録できる。' do
        user.introduce = nil
        expect(user).to be_valid
      end

      it 'adminが入力されていなくても登録できる。' do
        user.admin = nil
        expect(user).to be_valid
      end

      it '画像が添付されていなくても登録できる。' do
        user.image = nil
        expect(user).to be_valid
      end
    end

    context 'ユーザーの新規登録ができない場合' do
      it 'nameが入力されていないと登録できない' do
        user.name = nil
        user.valid?
        expect(user.errors.full_messages).to include 'Nameを入力してください'
      end

      it 'emailが入力されていないと登録できない' do
        user.email = nil
        user.valid?
        expect(user.errors.full_messages).to include 'メールアドレスを入力してください'
      end

      it '既に登録されているemailだと登録できない。' do
        user.save
        another_user.email = user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'メールアドレスはすでに存在します'
      end

      it 'emailに"@"が入っていないと登録できない' do
        user.email = 'testtest.com'
        user.valid?
        expect(user.errors.full_messages).to include 'メールアドレスは不正な値です'
      end

      it 'passwordが入力されていないと登録できない' do
        user.password = nil
        user.valid?
        expect(user.errors.full_messages).to include 'パスワードを入力してください'
      end

      it 'passswordが7文字以下だと登録できない' do
        user.password = '1234567'
        user.valid?
        expect(user.errors.full_messages).to include 'パスワードは不正な値です'
      end

      it 'passwordの中に数字が入っていないと登録できない' do
        user.password = 'abcdef!^'
        user.valid?
        expect(user.errors.full_messages).to include 'パスワードは不正な値です'
      end

      it 'passwordの中に英語(大文字・小文字問わず)が入っていないと登録できない' do
        user.password = '123456!^'
        user.valid?
        expect(user.errors.full_messages).to include 'パスワードは不正な値です'
      end

      it 'passwordの中に記号が2回以上入っていないと登録できない' do
        user.password = '1234567a'
        user.valid?
        expect(user.errors.full_messages).to include 'パスワードは不正な値です'
      end

      it 'password_confirmationが入力されていないと登録できない' do
        user.password_confirmation = nil
        user.valid?
        expect(user.errors.full_messages).to include '確認用パスワードを入力してください'
      end

      it 'password_confirmationがpasswordと同じ内容じゃないと登録できない' do
        user.password_confirmation = '12345678'
        user.valid?
        expect(user.errors.full_messages).to include '確認用パスワードとパスワードの入力が一致しません'
      end
    end
  end
end
