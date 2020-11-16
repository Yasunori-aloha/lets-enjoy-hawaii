require 'rails_helper'
include ActionDispatch::TestProcess

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
    @review.images = [fixture_file_upload('files/test_image.png', 'image/png')]
  end
  describe '口コミ新規投稿' do
    context '新規投稿ができる' do
      it 'title・comment・scoreの値と画像添付されていれば投稿できる' do
        expect(@review).to be_valid
      end
      it '画像が添付されていなくても投稿できる' do
        @review.images = nil
        expect(@review).to be_valid
      end
      it '画像は複数枚添付されていても投稿できる' do
        @review.images << [fixture_file_upload('files/test_image.png', 'image/png')]
        expect(@review).to be_valid
      end
    end
    context '新規投稿ができない' do
      it 'titleが入力されていないと投稿できない' do
      end
      it 'commentが入力されていないと投稿できない' do
      end
      it 'scoreが選択されていないと投稿できない' do
      end
    end
  end
end
