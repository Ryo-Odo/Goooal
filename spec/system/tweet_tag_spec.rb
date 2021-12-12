require 'rails_helper'

RSpec.describe 'つぶやきタグ機能', type: :system do

  describe 'つぶやきタグ投稿機能' do
    context '目標投稿後' do
      before do
        visit new_user_registration_path
        fill_in 'アカウント名', with:'user'
        fill_in 'メールアドレス', with:'user@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'
        click_on '目標を投稿'
        fill_in 'goal[goal_title]', with:'目標テスト'
        fill_in 'goal[description]', with:'詳細テスト'
        click_button '投稿する'
      end
      it '目標のつぶやきにタグを付けて投稿できる' do
        fill_in 'tweet[content]', with:'つぶやきテスト'
        fill_in 'tweet[tweet_tag_name]', with:'タグ１　タグ２'
        click_button 'つぶやく'
        expect(page).to have_content 'つぶやきました！'
        expect(page).to have_content 'タグ１'
        expect(page).to have_content 'タグ２'
      end
    end
  end
end
