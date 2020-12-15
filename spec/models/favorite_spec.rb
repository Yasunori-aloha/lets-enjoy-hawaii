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
