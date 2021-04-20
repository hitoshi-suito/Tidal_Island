require 'rails_helper'
RSpec.describe 'ブログ投稿機能', type: :system do
  # describe '新規作成機能' do
  #   context 'ブログを新規作成した場合' do
  #     it '作成したブログが表示される' do
  #       user = FactoryBot.create(:user)
  #       tide = FactoryBot.create(:tide)
  #       visit new_user_session_path
  #       fill_in 'user_email', with: 'hamada@example.com'
  #       fill_in 'user_password', with: 'hamada'
  #       click_on 'login_submit'
  #       click_on 'create_new_blog'
  #       fill_in 'blog_title', with: 'test'
  #       fill_in 'blog_content', with: 'content'
  #       click_on 'create_blog'
  #       expect(page).to have_content 'test'
  #       expect(page).to have_content 'content'
  #     end
  #   end
    # context '画像を投稿した場合' do
    #   it 'ブログ一覧に画像が表示される' do
        # user = FactoryBot.create(:user)
        # tide = FactoryBot.create(:tide)
        # visit new_user_session_path
        # fill_in 'user_email', with: 'hamada@example.com'
        # fill_in 'user_password', with: 'hamada'
        # click_on 'login_submit'
        # click_on 'create_new_blog'
        # fill_in 'blog_title', with: 'test'
        # fill_in 'blog_content', with: 'content'
        # attach_file 'image', "#{Rails.root}/app/assets/images/keep/test.jpg"
        # click_on 'create_blog'
  #     end
  #   end
  # end
  describe 'コメント機能' do
    context 'コメントを投稿した場合' do
      it 'コメントが表示される' do
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
        click_on 'show_blog'
        fill_in 'comment_content', with: 'comment'
        click_on 'create_comment'
        expect(page).to have_content 'comment'
      end
    end
    context 'コメントを編集した場合' do
      it '編集後のコメントが表示される' do
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
        click_on 'show_blog'
        fill_in 'comment_content', with: 'comment'
        click_on 'create_comment'
        fill_in 'comment_content', with: 'edit_comment'
        click_on 'create_comment'
        expect(page).to have_content 'edit_comment'
      end
    end
    context 'コメントを削除した場合' do
      it '該当コメントが表示されなくなる' do
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
        click_on 'show_blog'
        fill_in 'comment_content', with: 'comment'
        click_on 'create_comment'
        click_on 'delete_comment'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'コメントを削除しました'
      end
    end
  end
end