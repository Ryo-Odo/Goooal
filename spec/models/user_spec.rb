require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーモデル機能', type: :model do
    describe 'バリデーションのテスト' do

      context '名前が半角英数字とアンダーバーで構成されている・15文字以内、メールアドレスが255文字以内、パスワードが6文字以上の場合' do
        it 'バリデーションが通る' do
          user = User.new(user_account_name: 'abc_123',
                          email: 'user_1@email.com',
                          password: '111111',
                        )
          expect(user).to be_valid
        end
      end

      context '名前が半角英数字とアンダーバーで構成されていない場合' do
        it 'バリデーションが通らない' do
          user = User.new(user_account_name: 'テスト',
                          email: 'user_1@email.com',
                          password: '111111',
                        )
          expect(user).not_to be_valid
        end
      end

      context '名前が16文字以上の場合' do
        it 'バリデーションが通らない' do
          user = User.new(user_account_name: '1234567890abcdef',
                          email: 'user_1@email.com',
                          password: '111111',
                        )
          expect(user).not_to be_valid
        end
      end

      context 'メールアドレスが256文字以上の場合' do
        it 'バリデーションが通らない' do
          user = User.new(user_account_name: 'abc_123',
                          email: 'abcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcdefgabcd@email.com',
                          password: '111111',
                        )
          expect(user).not_to be_valid
        end
      end

      context 'パスワードが5文字以下の場合' do
        it 'バリデーションが通らない' do
          user = User.new(user_account_name: 'abc_123',
                          email: 'user_1@email.com',
                          password: '11111',
                        )
          expect(user).not_to be_valid
        end
      end


    end
  end
end
