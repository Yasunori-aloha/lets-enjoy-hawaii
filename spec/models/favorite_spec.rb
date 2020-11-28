# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) { build(:favorite) }
  let(:another_favorite) { build(:favorite) }

  describe 'アクティビティお気に入り登録' do
    context 'お気に入り登録ができる場合' do
      it 'ユーザーがまだお気に入り登録していないアクティビティなら登録できる' do
        expect(favorite).to be_valid
      end
    end
    context 'お気に入り登録ができない場合' do
      it 'ユーザーが既にお気に入り登録しているアクティビティなら登録できない' do
        favorite.save
        another_favorite.user_id = favorite.user_id
        another_favorite.experience_id = favorite.experience_id
        another_favorite.valid?
        expect(another_favorite.errors.full_messages).to include 'Userはすでに存在します'
      end
    end
  end
end
