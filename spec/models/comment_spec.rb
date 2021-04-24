require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do
    context 'コメントのコンテントが空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:normal_user)
        comment = Comment.new(content: '', user_id: user.id)
        expect(comment).not_to be_valid
      end
    end
    context 'コメントのコンテントが入力されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:normal_user)
        tide = FactoryBot.create(:tide)
        blog = FactoryBot.create(:blog, title: "test_blog", content: "test_blog", user_id: user.id, tide_id: tide.id)
        comment = Comment.new(content: 'comment', user_id: user.id, blog_id: blog.id)
        expect(comment).to be_valid
      end
    end
  end
end
