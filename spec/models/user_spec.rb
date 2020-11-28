# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  before do
    user.image = [fixture_file_upload("#{Rails.root}/spec/fixtures/files/test_image.png")]
  end

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
        # binding.pry
      end
    end
    context 'ユーザーの新規登録ができない場合' do
      it 'nameが入力されていないと登録できない' do
      end
      it 'emailが入力されていないと登録できない' do
      end
      it 'emailに"@"が入っていないと登録できない' do
      end
      it 'passwordが入力されていないと登録できない' do
      end
      it 'passswordが7文字以下だと登録できない' do
      end
      it 'passwordの中に数字が入っていないと登録できない' do
      end
      it 'passwordの中に英語(大文字・小文字問わず)が入っていないと登録できない' do
      end
      it 'passwordの中に記号が2回以上入っていないと登録できない' do
      end
      it 'password_confirmationが入力されていないと登録できない' do
      end
      it 'password_confirmationがpasswordと同じ内容じゃないと登録できない' do
      end
    end
  end
end
