# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre, type: :model do
  let(:genre) { build(:genre) }

  describe 'ジャンル登録' do
    context 'ジャンル登録ができる場合' do
      it 'name・category_idが入力されていると登録できる' do
        expect(genre).to be_valid
        # binding.pry
      end
    end
    context 'ジャンル登録ができない場合' do
      it 'nameが入力されていないと登録できない' do
      end
      it 'category_idが選択されていないと登録できない' do
      end
    end
  end
end
