require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'つぶやきモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      before do
        FactoryBot.create(:user)
        FactoryBot.create(:goal)
      end
      context 'つぶやきが140文字以内の場合' do
        it 'バリデーションが通る' do
          tweet = Tweet.new(goal_id: 1,
                            content: 'つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが',
                            )
          expect(tweet).to be_valid
        end
      end

      context 'つぶやきが141文字以上の場合' do
        it 'バリデーションが通らない' do
          tweet = Tweet.new(goal_id: 1,
                            content: 'つつぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが',
                            )
          expect(tweet).not_to be_valid
        end
      end

    end
  end
end
