require 'rails_helper'
Dir[Rails.root.join('spec/support/*.rb')].each { |f| require f }

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end
  # User一覧画面に遷移することを確認する
  it "shows the user list" do
    visit users_path
    expect(page).to have_content("ユーザー一覧")
  end
  # User新規登録ができることを確認する
  it "creates a user" do
    visit new_user_registration_path
    fill_in "user_email", with: "test@user.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("アカウント登録が完了しました。")
  end
  # User新規登録ができないことを確認する
  it "does not create a user with empty email" do
    visit new_user_registration_path
    fill_in "user_email", with: ""
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("Eメールを入力してください")
  end
  # User詳細画面に遷移することを確認する
  it "shows the user detail" do
    user = User.create(email: "user@test.com ", password: "password")
    visit user_path(user.id)
    expect(page).to have_content("ユーザー詳細")
  end
end
