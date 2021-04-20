require 'rails_helper'
RSpec.describe 'ブログ投稿機能', type: :system do
  describe '新規作成機能' do
    context 'ブログを新規作成した場合' do
      it '作成したブログが表示される' do
        blog = FactoryBot.create(:blog)
        visit blogs_path
        expect(page).to have_content 'blog'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのブログ一覧が表示される' do
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のブログ詳細画面に遷移した場合' do
       it '該当ブログの内容が表示される' do
       end
     end
  end
end