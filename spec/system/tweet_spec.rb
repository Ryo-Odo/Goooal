require 'rails_helper'

RSpec.describe 'つぶやき機能', type: :system do

  describe 'つぶやき投稿機能' do
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
      it '目標のつぶやきができる' do
        fill_in 'tweet[content]', with:'つぶやきテスト'
        click_button 'つぶやく'
        expect(page).to have_content 'つぶやきました！'
        expect(page).to have_content 'つぶやきテスト'
      end
    end
  end

  describe 'つぶやき削除機能' do
    context 'つぶやき投稿後' do
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
        fill_in 'tweet[content]', with:'つぶやきテスト'
        click_button 'つぶやく'
      end
      it 'つぶやきが削除できる' do
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'つぶやきを削除しました'
      end
    end

    context '他人がつぶやき投稿後' do
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
        fill_in 'tweet[content]', with:'つぶやきテスト'
        click_button 'つぶやく'
        click_on 'ログアウト'

        visit new_user_registration_path
        fill_in 'アカウント名', with:'user2'
        fill_in 'メールアドレス', with:'user2@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'

      end
      it '他人のつぶやきの削除はできない' do
        expect(page).not_to have_content '削除'
      end
    end
  end

end
