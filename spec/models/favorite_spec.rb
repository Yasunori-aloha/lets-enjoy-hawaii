# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) { build(:favorite) }

  describe 'アクティビティお気に入り登録' do
    context 'お気に入り登録ができる場合' do
      it 'ユーザーがまだお気に入り登録していないアクティビティなら登録できる' do
      end
    end
    context 'お気に入り登録ができない場合' do
      it 'ユーザーが既にお気に入り登録しているアクティビティなら登録できない' do
      end
    end
  end
end
