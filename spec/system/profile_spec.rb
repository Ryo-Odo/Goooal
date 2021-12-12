require 'rails_helper'

RSpec.describe 'プロフィール機能', type: :system do

  describe 'プロフィール編集機能' do

    context 'ログイン後' do
      before do
        visit new_user_registration_path
        fill_in 'アカウント名', with:'user'
        fill_in 'メールアドレス', with:'user@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'
      end
      it '自分のプロフィールが編集できること' do
        click_on 'マイページ'
        click_on 'プロフィールを編集'
        fill_in 'ユーザー名', with:'ユーザー名テスト'
        fill_in '自己紹介', with:'自己紹介テスト'
        click_button '登録する'
        expect(page).to have_content 'プロフィールを編集しました'
        expect(page).to have_content 'ユーザー名テスト'
        expect(page).to have_content '自己紹介テスト'
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
        click_on 'ログアウト'

        visit new_user_registration_path
        fill_in 'アカウント名', with:'user_2'
        fill_in 'メールアドレス', with:'user_2@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'
      end
      it '他人のプロフィールを編集することができないこと' do
        click_on '@user'
        expect(page).not_to have_content 'プロフィールを編集'
      end
    end

  end
end
