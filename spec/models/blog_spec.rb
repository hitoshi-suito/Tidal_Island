require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe 'バリデーションのテスト' do
    context 'ブログのコンテントが空の場合' do
      it 'バリデーションにひっかかる' do
         blog = Blog.new(content: '')
        expect(blog).not_to be_valid
       end
     end
     context 'ブログのコンテントが入力されている場合' do
       it 'バリデーションが通る' do
        tide = FactoryBot.create(:tide)
         user = FactoryBot.create(:normal_user)
         blog = Blog.new(content: 'test')
         blog.tide_id = tide.id
         blog.user_id = user.id
         expect(blog).to be_valid
       end
     end
  end
end
