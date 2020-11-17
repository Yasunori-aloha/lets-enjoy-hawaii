require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  before do
    @user = create(:user)
    @experience = create(:experience)
    @review = build(:review)
    @review.images = [fixture_file_upload('files/test_image.png', 'image/png')]
  end

  context '口コミの新規投稿ができる場合' do
    it 'ログインしているユーザーで、正常な値を入力していれば新規投稿ができる' do
    end
  end
  context '口コミの新規投稿ができない場合' do
    it '未ログインユーザーは口コミ投稿ページへ遷移するボタンが表示されない' do
    end
    it '未ログインユーザーは直接口コミ投稿ページへのリンクを打ち込んでもログイン画面へ遷移する' do
    end
  end
end
