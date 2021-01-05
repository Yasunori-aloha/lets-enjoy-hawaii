# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:experience) { create(:experience) }
  let(:favorite) { build(:favorite, experience_id: experience.id) }
  let(:another_favorite) { build(:favorite) }

  before do
    sleep(0.1)
  end

  describe 'アクティビティお気に入り登録' do
    context 'お気に入り登録ができる場合' do
      it 'ログインユーザーによるアクティビティに対しての初めてのお気に入り登録' do
        expect(favorite).to be_valid
      end
    end

    context 'お気に入り登録ができない場合' do
      it 'アクティビティに対しての2回目以上のお気に入り登録' do
        favorite.save
        another_favorite.user_id = favorite.user_id
        another_favorite.experience_id = favorite.experience_id
        another_favorite.valid?
        expect(another_favorite.errors.full_messages).to include 'Userはすでに存在します'
      end
      it '未ログインユーザーによるお気に入り登録' do
      end
      it '存在しないアクティビティに対してのお気に入り登録' do
      end
    end
  end
end
