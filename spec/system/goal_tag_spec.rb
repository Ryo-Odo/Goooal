require 'rails_helper'

RSpec.describe '目標タグ機能', type: :system do

  describe '目標タグ作成機能' do
    context 'ログイン後' do
      before do
        visit new_user_registration_path
        fill_in 'アカウント名', with:'user'
        fill_in 'メールアドレス', with:'user@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'
      end
      it '自分の目標にタグが付けられること' do
        click_on '目標を投稿'
        fill_in 'goal[goal_title]', with:'目標テスト'
        fill_in 'goal[description]', with:'詳細テスト'
        fill_in 'goal[goal_tag_name]', with:'タグ１　タグ２'
        click_button '投稿する'
        click_on '目標テスト'
        expect(page).to have_content 'タグ１'
        expect(page).to have_content 'タグ２'
      end
    end

  end
end
