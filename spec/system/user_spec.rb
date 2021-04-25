require 'rails_helper'
RSpec.describe 'ユーザ機能', type: :system do
  describe '新規登録機能' do
    context 'ユーザ新規作成した場合' do
      it 'ブログ一覧が表示される' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'test_user'
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: 'testtest'
        fill_in 'user_password_confirmation', with: 'testtest'
        click_on 'アカウントを作成する'
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
  end
  describe 'ログイン機能' do
    context 'ログイン画面に遷移した場合' do
      it 'ログインできる' do
        user = FactoryBot.create(:test_user)
        visit new_user_session_path
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: 'testtest'
        click_on 'login_submit'
        expect(page).to have_content 'ログインしました'
      end
    end
  end
end