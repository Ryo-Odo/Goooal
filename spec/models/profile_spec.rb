require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'プロフィールモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      before do
        FactoryBot.create(:user)
      end
      context '名前が15文字以内、自己紹介が255文字以内の場合' do
        it 'バリデーションが通る' do
          profile = Profile.new(user_id: 1,
                                user_name: '田中たかし田中たかし田中たかし',
                                introduction: 'つつぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきがつぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文',
                                )
          expect(profile).to be_valid
        end
      end

      context '名前が16文字以上の場合' do
        it 'バリデーションが通らない' do
          profile = Profile.new(user_id: 1,
                                user_name: 'し田中たかし田中たかし田中たかし',
                                introduction: 'つつぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきがつぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文',
                                )
          expect(profile).not_to be_valid
        end
      end

      context '自己紹介が256文字以上の場合' do
        it 'バリデーションが通らない' do
          profile = Profile.new(user_id: 1,
                                user_name: '田中たかし田中たかし田中たかし',
                                introduction: 'つつつぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきがつぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文字以内の場合つぶやきが140文',
                                )
          expect(profile).not_to be_valid
        end
      end

    end
  end
end