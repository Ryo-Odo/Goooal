require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'つぶやきモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      before do
        FactoryBot.create(:user)
        FactoryBot.create(:goal)
        FactoryBot.create(:tweet)
      end
      context 'コメントが140文字以内の場合' do
        it 'バリデーションが通る' do
          comment = Comment.new(user_id: 1,
                                tweet_id: 1,
                                content: 'つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが',
                                )
          expect(comment).to be_valid
        end
      end

      context 'コメントが141文字以上の場合' do
        it 'バリデーションが通らない' do
          comment = Comment.new(user_id: 1,
                                tweet_id: 1,
                                content: 'つつぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが',
                                )
          expect(comment).not_to be_valid
        end
      end

    end
  end
end
