require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do
    context 'コメントのコンテントが空の場合' do
      it 'バリデーションにひっかかる' do
        comment = Comment.new(content: '')
        expect(comment).not_to be_valid
      end
    end
    context 'コメントのコンテントが入力されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:normal_user)
        tide = FactoryBot.create(:tide)
        blog = Blog.new(content: 'blog')
        # binding.pry
        blog.user_id = user.id
        blog.tide_id = tide.id
        blog.save
        comment = Comment.new(content: 'comment')
        comment.user_id = user.id
        comment.blog_id = blog.id
        # binding.pry
        expect(comment).to be_valid
      end
    end
  end
end
