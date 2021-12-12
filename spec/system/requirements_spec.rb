require 'rails_helper'

RSpec.describe 'カタログ設計要求機能', type: :system do

  describe '目標一覧機能' do
    context '目標を' do
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
        click_on '目標を投稿'
        fill_in 'goal[goal_title]', with:'目標テスト２'
        fill_in 'goal[description]', with:'詳細テスト２'
        click_button '投稿する'
      end
      it '一覧で表示できる' do
        expect(page).to have_content '目標テスト'
        expect(page).to have_content '目標テスト２'
      end
    end
  end

  describe 'つぶやき一覧機能' do
    context 'つぶやきを' do
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
        fill_in 'tweet[content]', with:'つぶやきテスト２'
        fill_in 'tweet[tweet_tag_name]', with:'タグ１　タグ２'
        click_button 'つぶやく'
      end
      it '一覧で表示できる' do
        expect(page).to have_content 'つぶやきテスト'
        expect(page).to have_content 'つぶやきテスト２'
      end
    end
  end

  describe 'ユーザー一覧機能' do
    context 'ユーザーを' do
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
      it '一覧で表示できる' do
        expect(page).to have_content 'user'
        expect(page).to have_content 'user_2'
      end
    end
  end

  describe '目標検索機能' do
    context '目標を' do
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

        click_on '目標を投稿'
        fill_in 'goal[goal_title]', with:'目標テスト２'
        fill_in 'goal[description]', with:'詳細テスト２'
        click_button '投稿する'
      end
      it 'キーワードで検索することが出来る' do
        click_on '目標を検索'
        fill_in 'q[goal_title_or_description_cont]', with:'目標テスト'
        click_button 'キーワードで検索'
        expect(page).to have_content 'キーワード: 目標テスト'
      end
    end

    context '目標を' do
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
        fill_in 'goal[goal_tag_name]', with:'タグ１　タグ２'
        click_button '投稿する'

        click_on '目標を投稿'
        fill_in 'goal[goal_title]', with:'目標テスト２'
        fill_in 'goal[description]', with:'詳細テスト２'
        fill_in 'goal[goal_tag_name]', with:'タグ１　タグ２'
        click_button '投稿する'
      end
      it 'タグで検索することが出来る' do
        click_on '目標を検索'
        fill_in 'q[goal_tags_goal_tag_name_eq]', with:'タグ１'
        click_button 'タグで検索'
        expect(page).to have_content 'タグ名: タグ１'
      end
    end

  end

  describe 'つぶやき検索機能' do
    context 'つぶやきを' do
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
      it 'キーワードで検索することが出来る' do
        click_on 'つぶやきを検索'
        fill_in 'q[content_cont]', with:'つぶやきテスト'
        click_button 'キーワードで検索'
        expect(page).to have_content 'キーワード: つぶやきテスト'
      end
    end

    context 'つぶやきを' do
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
        fill_in 'goal[goal_tag_name]', with:'タグ１　タグ２'
        click_button '投稿する'
        fill_in 'tweet[content]', with:'つぶやきテスト'
        fill_in 'tweet[tweet_tag_name]', with:'タグ１　タグ２'
        click_button 'つぶやく'
      end
      it 'タグで検索することが出来る' do
        click_on 'つぶやきを検索'
        fill_in 'q[tweet_tags_tweet_tag_name_eq]', with:'タグ１'
        click_button 'タグで検索'
        expect(page).to have_content 'タグ名: タグ１'
      end
    end
  end

  describe 'ユーザー検索機能' do
    context 'ユーザーを' do
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
      it '名前から検索することが出来る' do
        click_on 'ユーザーを検索'
        fill_in 'q[profile_user_name_or_user_account_name_cont]', with:'user'
        click_button 'ユーザー名・アカウント名を検索'
        expect(page).to have_content 'ユーザー名・アカウント名: user'
      end
    end

    context 'ユーザーを' do
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
      it '自己紹介文から検索することが出来る' do
        click_on 'ユーザーを検索'
        fill_in 'q[profile_introduction_cont]', with:'自己紹介'
        click_button '自己紹介文を検索'
        expect(page).to have_content '自己紹介文: 自己紹介'
      end
    end
  end

  describe 'フォロー一覧機能機能' do
    context 'フォロー中のユーザーを' do
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
      it '一覧で表示できる' do
        click_on 'マイページ'
        all(".user_follow")[0].click
        expect(page).to have_content '新しいユーザーさんのフォロー'
      end
    end

    context 'フォロワーのユーザーを' do
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
      it '一覧で表示できる' do
        click_on 'マイページ'
        all(".user_follow")[1].click
        expect(page).to have_content '新しいユーザーさんのフォロワー'
      end
    end

  end
end
