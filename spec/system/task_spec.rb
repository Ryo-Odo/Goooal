require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
    @user_1 = FactoryBot.create(:user)
    @user_2 = FactoryBot.create(:second_user)
  end
  describe '新規作成機能' do
    before do
      visit new_session_path
      fill_in 'Email', with:'user_1@email.com'
      fill_in 'Password', with:'111111'
      click_button 'Log in'
    end
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        # 2. 新規登録内容を入力する
        #「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄にタスクのタイトルと内容をそれぞれ入力する
        fill_in "タスク名", with: 'test_task'
        fill_in "詳しい内容", with: 'test_content'
        select '2021', from:'task_deadline_1i'
        select '10月', from:'task_deadline_2i'
        select '10', from:'task_deadline_3i'
        select '未着手', from:'task_status'
        select '低', from:'task_priority'
        # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
        click_on "登録する"
        # 4. clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
        # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
        expect(page).to have_content 'test_task'
        expect(page).to have_content 'test_content'
        expect(page).to have_content '2021-10-10'
        expect(page).to have_content '未着手'
        expect(page).to have_content '低'
      end
    end
  end

  describe '一覧表示機能' do
    before do
      visit new_session_path
      fill_in 'Email', with:'user_1@email.com'
      fill_in 'Password', with:'111111'
      click_button 'Log in'
    end
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        # テストで使用するためのタスクを作成
        task = FactoryBot.create(:task)
        # タスク一覧ページに遷移
        visit tasks_path
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
        expect(page).to have_content 'test_task_name'
        # expectの結果が true ならテスト成功、false なら失敗として結果が
      end
    end
    # テスト内容を追加で記載する
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        # ここに実装する\
        FactoryBot.create(:task)
        sleep 2
        FactoryBot.create(:second_task)
        visit tasks_path
        task_list_1 = all('tr')[1].all('td')
        task_list_2 = all('tr')[2].all('td')
        expect(task_list_1[1]).to have_content 'test_task_name_2'
        expect(task_list_1[2]).to have_content 'test_content_2'
        expect(task_list_2[1]).to have_content 'test_task_name'
        expect(task_list_2[2]).to have_content 'test_content'
      end
    end

    context 'タスクが終了期限の降順に並んでいる場合' do
      it '終了期限が遠いタスクが一番上に表示される' do
        FactoryBot.create(:task)
        sleep 2
        FactoryBot.create(:second_task)
        visit tasks_path(sort_deadline: "true")
        task_list_1 = all('tr')[1].all('td')
        task_list_2 = all('tr')[2].all('td')
        expect(task_list_1[3]).to have_content '2022-12-22'
        expect(task_list_2[3]).to have_content '2021-11-11'
      end
    end

    context 'タスクがステータスの降順に並んでいる場合' do
      it 'ステータスが高いタスクが一番上に表示される' do
        FactoryBot.create(:task)
        sleep 2
        FactoryBot.create(:second_task)
        visit tasks_path(sort_priority: "true")
        task_list_1 = all('tr')[1].all('td')
        task_list_2 = all('tr')[2].all('td')
        expect(task_list_1[5]).to have_content '高'
        expect(task_list_2[5]).to have_content '低'
      end
    end

  end
  describe '詳細表示機能' do
    before do
      visit new_session_path
      fill_in 'Email', with:'user_1@email.com'
      fill_in 'Password', with:'111111'
      click_button 'Log in'
    end
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        task = FactoryBot.create(:task)
        visit task_path(task.id)
        expect(page).to have_content 'test_task_name'
        expect(page).to have_content 'test_content'
      end
    end
  end
  User.destroy_all
end
