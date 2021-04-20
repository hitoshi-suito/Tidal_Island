require 'rails_helper'
RSpec.describe 'ユーザ機能', type: :system do
  describe '新規登録機能' do
    context 'ユーザ新規作成した場合' do
      it 'ブログ一覧が表示される' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'hamada'
        fill_in 'user_email', with: 'hamada@example.com'
        fill_in 'user_password', with: 'hamada'
        fill_in 'user_password_confirmation', with: 'hamada'
        click_on 'account_submit'
        expect(page).to have_content 'ブログ一覧'
      end
    end
  end
  describe 'ログイン機能' do
    context 'ログイン画面に遷移した場合' do
      it 'ログインできる' do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'user_email', with: 'hamada@example.com'
        fill_in 'user_password', with: 'hamada'
        click_on 'login_submit'
        expect(page).to have_content 'ブログ一覧'
      end
    end
  end
end