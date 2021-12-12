require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do

  describe 'ユーザー登録' do
    context '未ログイン状態の時に' do
      it 'ユーザの新規登録ができること' do
        visit new_user_registration_path

        fill_in 'アカウント名', with:'user'
        fill_in 'メールアドレス', with:'user@email.com'
        fill_in 'パスワード', with:'111111'
        fill_in 'パスワード再入力', with:'111111'
        click_button 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end

      it 'タスク一覧画面に飛ぼうとするとログイン画面に遷移すること' do
        visit tasks_path
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Password'
      end
    end
  end
  describe 'セッション機能' do
    context '未ログイン状態の時に' do
      before do
        FactoryBot.create(:user)
      end
      it 'ログインができること' do
        visit new_session_path
        fill_in 'Email', with:'user_1@email.com'
        fill_in 'Password', with:'111111'
        click_button 'Log in'
        expect(page).to have_content 'user_1のページ'
      end
    end

    context '一般ユーザーとしてログインしている時に' do
      before do
        @user_1 = FactoryBot.create(:user)
        @user_2 = FactoryBot.create(:second_user)
        visit new_session_path
        fill_in 'Email', with: 'user_1@email.com'
        fill_in 'Password', with: '111111'
        click_button 'Log in'
      end
      it '自分の詳細画面(マイページ)に飛べること' do
        visit user_path(@user_1.id)
        expect(page).to have_content 'user_1のページ'
      end

      it '一般ユーザが他人の詳細画面に飛ぶとタスク一覧画面に遷移すること' do
        visit user_path(@user_2.id)
        expect(page).not_to have_content 'user_2のページ'
      end

      it 'ログアウトができること' do
        visit tasks_path
        click_on 'Logout'
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end

  describe '管理者機能' do
    before do
      @user_1 = FactoryBot.create(:user)
      @user_2 = FactoryBot.create(:second_user)
    end
    context '一般ユーザーとしてログインしている時に' do
      before do
        visit new_session_path
        fill_in 'Email', with: 'user_1@email.com'
        fill_in 'Password', with: '111111'
        click_button 'Log in'
      end

      it '管理画面にアクセスできないこと' do
        visit admin_users_path
        expect(page).to have_content '管理ユーザーでアクセスして下さい'
      end
    end

    context '管理ユーザーとしてログインしている時に' do
      before do
        visit new_session_path
        fill_in 'Email', with: 'user_2@email.com'
        fill_in 'Password', with: '222222'
        click_button 'Log in'
      end

      it '管理画面にアクセスできること' do
        visit admin_users_path
        expect(page).to have_content 'ユーザー一覧'
      end

      it 'ユーザの新規登録ができること' do
        visit new_admin_user_path
        fill_in '名前', with:'test'
        fill_in 'メールアドレス', with:'test@email.con'
        fill_in 'パスワード', with:'testtest'
        fill_in '確認用パスワード', with:'testtest'
        click_button 'Create account'
        expect(page).to have_content 'ユーザー登録しました'
      end

      it 'ユーザの詳細画面にアクセスできること' do
        visit admin_user_path(@user_1.id)
        expect(page).to have_content 'ユーザータスク詳細'
        expect(page).to have_content 'ユーザー名: user'
      end

      it 'ユーザの編集画面からユーザを編集できること' do
        visit edit_admin_user_path(@user_1.id)
        fill_in '名前', with:'user_3'
        fill_in 'メールアドレス', with:'user_3@email.com'
        click_button 'Change account'
        expect(page).to have_content '編集しました！'
      end

      it 'ユーザの削除をできること' do
        visit admin_users_path
        click_on '削除', match: :first
        accept_confirm
        expect(page).to have_content '削除しました'
      end
    end
  end





  describe "管理画面のテスト" do
    before do
      @user_1 = FactoryBot.create(:user)
      @user_2 = FactoryBot.create(:second_user)
    end
    context "管理ユーザーでログインしている場合" do
      before do
        visit new_session_path
        fill_in 'Email', with: 'user_2@email.com'
        fill_in 'Password', with: '222222'
        click_button 'Log in'
      end
      it "管理者は管理画面にアクセスできること" do
        visit admin_users_path
        expect(page).to have_content "ユーザー一覧"
      end
      it "管理者はユーザを新規登録できること" do
        visit admin_users_path
        click_on "ユーザーを登録する"
        fill_in '名前', with: 'test'
        fill_in 'メールアドレス', with: 'test@email.com'
        fill_in 'パスワード', with: 'testtest'
        fill_in '確認用パスワード', with: 'testtest'
        click_on 'Create account'
        expect(page).to have_content 'ユーザー名: test'
      end

      it  "管理者はユーザの詳細画面にアクセスできること" do
        visit admin_user_path(@user_1.id)
        expect(page).to have_content 'ユーザー名: user_1'
      end

      it "管理者はユーザの編集画面からユーザを編集できること" do
        visit edit_admin_user_path(@user_1.id)
        fill_in 'user[name]', with: 'user_3'
        fill_in 'user[email]', with: 'user_3@email.com'
        click_on 'Change account'
        expect(page).to have_content 'user_3@email.com'
      end

      it "管理者はユーザの削除をできること" do
        visit admin_users_path
        click_on '削除', match: :first
        accept_confirm
        expect(page).to have_content '削除しました'
      end
    end

    context "一般ユーザーでログインしている場合" do
      before do
        visit new_session_path
        fill_in 'Email', with: 'user_1@email.com'
        fill_in 'Password', with: '111111'
        click_button 'Log in'
      end
      it "一般ユーザは管理画面にアクセスできないこと" do
        visit admin_users_path
        expect(page).to have_content "管理ユーザーでアクセスして下さい"
      end
    end
  end
end
