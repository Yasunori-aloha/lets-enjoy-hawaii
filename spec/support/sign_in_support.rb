# frozen_string_literal: true

module SignInSupport
  def sign_in(user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'ログイン'
    expect(page).to have_current_path root_path, ignore_query: true
  end
end
