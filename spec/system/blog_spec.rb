require 'rails_helper'
RSpec.describe 'ブログ投稿機能', type: :system do
  describe '新規作成機能' do
    context 'ブログを新規作成した場合' do
      it '作成したブログが表示される' do
        user = FactoryBot.create(:user)
        tide = FactoryBot.create(:tide)
        visit new_user_session_path
        fill_in 'user_email', with: 'hamada@example.com'
        fill_in 'user_password', with: 'hamada'
        click_on 'login_submit'
        click_on 'create_new_blog'
        fill_in 'blog_title', with: 'test'
        fill_in 'blog_content', with: 'content'
        click_on 'create_blog'
        expect(page).to have_content 'test'
        expect(page).to have_content 'content'
      end
    end
    context '画像を投稿した場合' do
      it 'ブログ一覧に画像が表示される' do
        user = FactoryBot.create(:user)
        tide = FactoryBot.create(:tide)
        visit new_user_session_path
        fill_in 'user_email', with: 'hamada@example.com'
        fill_in 'user_password', with: 'hamada'
        click_on 'login_submit'
        click_on 'create_new_blog'
        fill_in 'blog_title', with: 'test'
        fill_in 'blog_content', with: 'content'
        attach_file 'image', "#{Rails.root}/app/assets/images/keep/test.jpg"
        click_on 'create_blog'
      end
    end
  end
end