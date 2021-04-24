require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe 'バリデーションのテスト' do
    context 'ブログのコンテントが空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:normal_user)
        tide = FactoryBot.create(:tide)
        blog = Blog.new(content: '', user_id: user.id, tide_id: tide.id)
        expect(blog).not_to be_valid
       end
     end
     context 'ブログのコンテントが入力されている場合' do
       it 'バリデーションが通る' do
        user = FactoryBot.create(:normal_user)
        tide = FactoryBot.create(:tide)
        blog = Blog.new(content: 'test', user_id: user.id, tide_id: tide.id)
         expect(blog).to be_valid
       end
     end
  end
end
