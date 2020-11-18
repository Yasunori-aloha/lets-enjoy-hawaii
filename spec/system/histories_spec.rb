require 'rails_helper'

RSpec.describe "Histories", type: :system do
  let(:user) {create(:user)}
  let(:experience) {create(:experience)}

  describe '行ったボタンクリック時の動作' do
    context '行った記録がクリックした際にDBに保存される場合' do
      it 'ログインユーザーで、初めてクリックする場合はDBに保存される。' do
      end
    end
    context '行った記録がクリックした際にDBから消去される場合' do
      it 'ログインユーザーですでに記録が保存されているアクティビティではクリックするとDBから記録が消去される。' do
      end
    end
    context 'DBに記録が保存も消去もできない場合' do
      it '未ログインユーザーは行ったボタンが表示されない。' do
      end
      it '未ログインユーザーはURLを直接打ち込んでもログインページに遷移される。' do
      end
    end
  end
end
