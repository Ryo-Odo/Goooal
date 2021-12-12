require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe '目標モデル機能', type: :model do
    describe 'バリデーションのテスト' do
      before do
        FactoryBot.create(:user)
      end
      context '目標のタイトルがある場合' do
        it 'バリデーションが通る' do
          goal = Goal.new(goal_title: 'テスト', description: '成功テスト', user_id: 1)
          expect(goal).to be_valid
        end
      end
      context '目標のタイトルが空の場合' do
        it 'バリデーションにひっかる' do
          goal = Goal.new(goal_title: '', description: '失敗テスト', user_id: 1)
          expect(goal).not_to be_valid
        end
      end
      context '目標のタイトルが45文字以下の場合' do
        it 'バリデーションが通る' do
          goal = Goal.new(goal_title: '111111111111111111111111111111111111111111111', description: '成功テスト', user_id: 1)
          expect(goal).to be_valid
        end
      end
      context '目標のタイトルが46文字以上の場合' do
        it 'バリデーションにひっかかる' do
          goal = Goal.new(goal_title: '1111111111111111111111111111111111111111111111', description: '失敗テスト', user_id: 1)
          expect(goal).not_to be_valid
        end
      end
      context '目標の詳細が255文字以下の場合' do
        it 'バリデーションが通る' do
          goal = Goal.new(goal_title: '成功テスト', description: '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', user_id: 1)
          expect(goal).to be_valid
        end
      end
      context '目標の詳細が256文字以上の場合' do
        it 'バリデーションにひっかかる' do
          goal = Goal.new(goal_title: '失敗テスト', description: '1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', user_id: 1)
          expect(goal).not_to be_valid
        end
      end
    end
  end
end
