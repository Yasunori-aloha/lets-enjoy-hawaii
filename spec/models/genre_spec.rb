# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre, type: :model do
  let(:genre) { build(:genre) }

  before do
    sleep(0.1)
  end

  describe 'ジャンル登録' do
    context 'ジャンル登録ができる場合' do
      it 'ジャンル名・カテゴリーが入力されていると登録できる' do
        expect(genre).to be_valid
      end
    end

    context 'ジャンル登録ができない場合' do
      it 'ジャンル名が入力されていないと登録できない' do
        genre.name = nil
        genre.valid?
        expect(genre.errors.full_messages).to include 'ジャンル名を入力してください'
      end

      it 'カテゴリーが選択されていないと登録できない' do
        genre.category_id = nil
        genre.valid?
        expect(genre.errors.full_messages).to include 'カテゴリーを入力してください'
      end
    end
  end
end
