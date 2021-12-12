require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do

  describe 'ユーザー登録、ログイン機能' do
    context '未ログイン状態の時に' do
      it 'ユーザの新規登録しログイン出来ること' do
        visit new_user_registration_path
        fill_in 'アカウント名', with:'user'
        fill_in 'メールアドレス', with:'user@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end

  describe 'ログアウト、ログイン機能' do
    context 'アカウント作成、ログアウト後に' do
      before do
        visit new_user_registration_path
        fill_in 'アカウント名', with:'user'
        fill_in 'メールアドレス', with:'user@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'
        click_on 'ログアウト'
      end
      it 'ログインができること' do
        visit new_user_session_path
        fill_in 'メールアドレス', with:'user@email.com'
        fill_in 'パスワード', with:'111111'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end
  end

  describe 'アカウント削除機能' do
    context 'アカウント作成後' do
      before do
        visit new_user_registration_path
        fill_in 'アカウント名', with:'user'
        fill_in 'メールアドレス', with:'user@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'
      end
      it 'アカウントが削除できること' do
        click_on 'マイページ'
        click_on 'アカウントを削除する'
        click_button 'アカウント削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'アカウントを削除しました。またのご利用をお待ちしております。'
      end
    end
  end

  describe '一般ゲストログイン機能' do
    context '一般ゲストアカウントで' do
      before do
        visit new_user_session_path
        click_on '一般ゲストログイン'
      end
      it 'ログインできること' do
        expect(page).to have_content '一般ゲストユーザーとしてログインしました。'
      end
    end
  end

  describe '管理ゲストログイン機能' do

    context '管理ゲストアカウントで' do
      before do
        visit new_user_session_path
        click_on '管理ゲストログイン'
      end
      it 'ログインできること' do
        expect(page).to have_content '管理ゲストユーザーとしてログインしました。'
      end
    end

    context '管理ゲストアカウントでログイン後' do
      before do
        visit new_user_session_path
        click_on '管理ゲストログイン'
      end
      it '管理画面をへ行けること' do
        click_on '管理画面'
        expect(page).to have_content 'サイト管理'
      end
    end

  end
end
