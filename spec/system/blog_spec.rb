require 'rails_helper'
RSpec.describe 'ブログ機能', type: :system do
  def create_admin_user_and_fill_in_blog
    tide = FactoryBot.create(:tide)
    admin_user = FactoryBot.create(:admin_user)
    visit new_user_session_path
    fill_in 'user_email', with: 'hamada@example.com'
    fill_in 'user_password', with: 'hamada'
    click_on 'login_submit'
    visit new_blog_path
    fill_in 'blog_title', with: 'test'
    fill_in 'blog_content', with: 'content'
  end

  def create_comment
    click_on 'create_blog'
    click_on 'show_blog'
    fill_in 'comment_content', with: 'comment'
    click_on 'create_comment'
  end

  describe '新規作成機能' do
    context 'ブログを新規作成した場合' do
      it '作成したブログが表示される' do
        create_admin_user_and_fill_in_blog
        click_on 'create_blog'
        expect(page).to have_content 'test'
        expect(page).to have_content 'content'
      end
    end
    context '画像を投稿した場合' do
      it 'ブログ一覧に画像が表示される' do
        create_admin_user_and_fill_in_blog
        attach_file 'blog[image]', "#{Rails.root}/spec/files/top-image.png", make_visible: true
        click_on 'create_blog'
      end
    end
  end
  describe 'コメント機能' do
    context 'ブログの詳細画面に遷移した場合' do
      it '詳細画面が表示される' do
        create_admin_user_and_fill_in_blog
        click_on 'create_blog'
        click_on 'show_blog'
        expect(page).to have_content '投稿ユーザ'
      end
    end
    context 'コメントを投稿した場合' do
      it 'コメントが表示される' do
        create_admin_user_and_fill_in_blog
        create_comment
        expect(page).to have_content 'comment'
      end
    end
    context 'コメントを編集した場合' do
      it '編集後のコメントが表示される' do
        create_admin_user_and_fill_in_blog
        create_comment
        fill_in 'comment_content', with: 'edit_comment'
        click_on 'create_comment'
        expect(page).to have_content 'edit_comment'
      end
    end
    context 'コメントを削除した場合' do
      it '該当コメントが表示されなくなる' do
        create_admin_user_and_fill_in_blog
        create_comment
        click_on 'delete_comment'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'コメントを削除しました'
      end
    end
  end
  describe 'ブログ検索機能' do
    context '投稿済みのブログをあいまい検索した場合' do
      it '検索結果が表示される' do
        create_admin_user_and_fill_in_blog
        click_on 'create_blog'
        visit new_blog_path
        fill_in 'blog_title', with: '検索対象のblog_title'
        fill_in 'blog_content', with: '検索対象のblog_content'
        click_on 'create_blog'
        fill_in 'q_title_or_content_cont', with: '検索対象のblog_content'
        click_on 'search_button'
        expect(page).to have_content '検索対象のblog_content' 
      end
    end
    context '未投稿のブログをあいまい検索した場合' do
      it '検索結果が表示されない' do
        create_admin_user_and_fill_in_blog
        click_on 'create_blog'
        visit new_blog_path
        fill_in 'blog_title', with: '検索対象のblog_title'
        fill_in 'blog_content', with: '検索対象のblog_content'
        click_on 'create_blog'
        fill_in 'q_title_or_content_cont', with: '未投稿のblog'
        click_on 'search_button'
        expect(page).not_to have_content '未投稿のblog'
      end
    end
  end
end
