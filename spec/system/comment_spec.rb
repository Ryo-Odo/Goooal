require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do

  describe 'コメント投稿機能' do
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
        fill_in 'tweet[tweet_tag_name]', with:'タグ１　タグ２'
        click_button 'つぶやく'
      end
      it 'つぶやきにコメントを投稿できる' do
        click_on 'つぶやきテスト'
        fill_in 'comment[content]', with:'コメントテスト'
        click_button '投稿する'
        expect(page).to have_content 'コメントを投稿しました'
        expect(page).to have_content 'コメントテスト'
      end
    end
  end

  describe 'コメント削除機能' do

    context 'コメント投稿後' do
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
        fill_in 'tweet[tweet_tag_name]', with:'タグ１　タグ２'
        click_button 'つぶやく'
        click_on 'つぶやきテスト'
        fill_in 'comment[content]', with:'コメントテスト'
        click_button '投稿する'
      end
      it 'コメントが削除できる' do
        all(".delete_link")[1].click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'コメントを削除しました'
      end
    end

    context '他人がコメント投稿後' do
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
        fill_in 'tweet[tweet_tag_name]', with:'タグ１　タグ２'
        click_button 'つぶやく'
        click_on 'つぶやきテスト'
        fill_in 'comment[content]', with:'コメントテスト'
        click_button '投稿する'
        click_on 'ログアウト'

        visit new_user_registration_path
        fill_in 'アカウント名', with:'user_2'
        fill_in 'メールアドレス', with:'user_2@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'
      end
      it '他人のコメントは削除できない' do
        click_on 'つぶやきテスト'
        expect(page).not_to have_content '削除'
      end
    end
  end



end
