require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context '名前が空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: '', email: 'test@example.com', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'メールが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: 'test', email: '', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: 'test', email: 'test@example.com', password: '')
        expect(user).not_to be_valid
      end
    end
    context '名前・メール・パスワードが全て入力されている場合' do
      it 'バリデーションが通る' do
        user = User.create(name: 'test', email: 'test@example.com', password: 'password')
        expect(user).to be_valid
      end
    end
  end
end
