require 'rails_helper'
Rails.root.glob('spec/support/*.rb').each { |f| require f }

RSpec.describe 'Users', type: :system do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }

  before do
    driven_by(:rack_test)
  end

  it 'User一覧画面に遷移することを確認する' do
    visit users_path
    expect(page).to have_content('ユーザー一覧')
  end

  it 'User新規登録ができることを確認する' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'test@user.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('アカウント登録が完了しました。')
  end

  it 'User新規登録ができないことを確認する' do
    visit new_user_registration_path
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Eメールを入力してください')
  end

  it 'ユーザー一覧から、ユーザーをクリックして user_path に遷移していることを確認する' do
    sign_in user, scope: :user
    click_link 'ユーザー一覧'
    expect(page).to have_content('ユーザー一覧')
    click_on 'admin@init.com'
    have_current_path(user_path(1))
    expect(page).to have_content('ユーザー詳細')
  end

  it 'User詳細画面に遷移することを確認する' do
    user = User.create(email: 'user@test.com ', password: 'password')
    visit user_path(user.id)
    expect(page).to have_content('ユーザー詳細')
  end
end
