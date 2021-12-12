require 'rails_helper'

RSpec.describe 'フォロー機能', type: :system do

  describe 'フォローする' do
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
      it '他人をフォローできる' do
        click_on '@user'
        click_button 'フォローする'
        expect(page).to have_content 'フォローしました'
      end
    end
  end

  describe 'フォローを解除する' do
    context 'フォロー後' do
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
        click_on '@user'
        click_button 'フォローする'
      end
      it 'フォローを解除出来る' do
        click_button 'フォローを解除する'
        expect(page).to have_content 'フォローを解除しました'
      end
    end
  end
end
