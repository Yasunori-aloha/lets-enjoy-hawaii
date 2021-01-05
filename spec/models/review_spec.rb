# frozen_string_literal: true

require 'rails_helper'
include ActionDispatch::TestProcess

RSpec.describe Review, type: :model do
  let(:review) { build(:review) }

  before do
    sleep(0.1)
  end

  describe '口コミ新規投稿' do
    context '新規投稿ができる' do
      it '題名・本文・評価点の値と画像添付されていれば投稿できる' do
        expect(review).to be_valid
      end

      it '画像が添付されていなくても投稿できる' do
        review.images = nil
        expect(review).to be_valid
      end

      it '画像は複数枚添付されていても投稿できる' do
        review.images <<
          [fixture_file_upload('files/test_image.png', 'image/png')]
        expect(review).to be_valid
      end
    end

    context '新規投稿ができない' do
      it '題名が入力されていないと投稿できない' do
        review.title = nil
        review.valid?
        expect(review.errors.full_messages).to include(
          'Titleを入力してください'
        )
      end

      it '本文が入力されていないと投稿できない' do
        review.comment = nil
        review.valid?
        expect(review.errors.full_messages).to include(
          'Commentを入力してください'
        )
      end

      it '評価点が選択されていないと投稿できない' do
        review.score = nil
        review.valid?
        expect(review.errors.full_messages).to include(
          'Scoreを入力してください'
        )
      end
    end
  end
end
