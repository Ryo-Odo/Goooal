require 'rails_helper'

RSpec.describe '目標機能', type: :system do

  describe '目標投稿機能' do

    context 'ログイン後' do
      before do
        visit new_user_registration_path
        fill_in 'アカウント名', with:'user'
        fill_in 'メールアドレス', with:'user@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'
      end
      it '自分の目標が投稿できる' do
        click_on '目標を投稿'
        fill_in 'goal[goal_title]', with:'目標テスト'
        fill_in 'goal[description]', with:'詳細テスト'
        click_button '投稿する'
        expect(page).to have_content '目標を投稿しました！'
        expect(page).to have_content '目標テスト'
      end
    end

    context '目標が投稿後' do
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
      it '自分の目標を削除できる' do
        click_on '目標テスト'
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '目標を削除しました'
      end
    end

    context 'ログイン後' do
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
        click_on 'ログアウト'

        visit new_user_registration_path
        fill_in 'アカウント名', with:'user_2'
        fill_in 'メールアドレス', with:'user_2@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'
      end
      it '他人の目標を削除することができないこと' do
        click_on '目標テスト'
        expect(page).not_to have_content '削除'
      end
    end

  end
end
