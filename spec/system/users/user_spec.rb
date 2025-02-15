require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :system do

  context '入力情報正常系' do
    it 'ユーザーが新規作成できること' do
      visit '/users/new'
      expect {
        fill_in '姓', with: 'らんてっく'
        fill_in '名', with: 'たろう'
        fill_in 'メールアドレス', with: 'example@example.com'
        fill_in 'パスワード', with: '12345678'
        fill_in 'パスワード確認', with: '12345678'
        click_button '登録'
        Capybara.assert_current_path("/", ignore_query: true)
      }.to change { User.count }.by(1)
    end
  end

  context '入力情報異常系' do
    it 'ユーザーが新規作成できない' do
      visit '/users/new'
      expect {
        fill_in 'メールアドレス', with: 'example@example.com'
        click_button '登録'
      }.to change { User.count }.by(0)
    end
  end
end
