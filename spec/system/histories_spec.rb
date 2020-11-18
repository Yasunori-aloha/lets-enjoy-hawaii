require 'rails_helper'

RSpec.describe "Histories", type: :system do
  let(:user) {create(:user)}
  let(:experience) {create(:experience)}

  describe '行ったボタンクリック時の動作' do
    context '行った記録がクリックした際にDBに保存される場合' do
      it 'ログインユーザーで、初めてクリックする場合はDBに保存される。' do
        # ログインする。
        visit new_user_session_path
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_on 'ログイン'
        expect(current_path).to eq root_path

        # アクティビティ詳細ページへ移動して、行ったボタンがあるか確認する。
        visit experience_path(experience.id)
        expect(page).to have_content('行った')

        # 行ったボタンをクリックするとHistoryモデルのレコード数が1上がり、足跡アイコンがチェックマークに変化する。
        expect{find('.have_been_btn').click}.to change {History.count}.by(1)
        expect(page).to have_selector('.fa-check')
      end
    end
    context '行った記録がクリックした際にDBから消去される場合' do
      it 'ログインユーザーですでに記録が保存されているアクティビティではクリックするとDBから記録が消去される。' do
      end
    end
    context 'DBに記録が保存も消去もできない場合' do
      it '未ログインユーザーは行ったボタンが表示されない。' do
      end
    end
  end
end
