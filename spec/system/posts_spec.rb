require 'rails_helper'
Dir[Rails.root.join('spec/support/*.rb')].each { |f| require f }

RSpec.describe "Posts", type: :system do
  # 投稿作成
  let(:user) { User.create(email: "test@example.com", password: "password") }
  let(:post) { Post.create(content: "This is a test post.", user_id: user.id) }


  before do
    driven_by(:rack_test)
    sign_in user, scope: :user
  end
  it "ポストが作成されること" do
    visit new_post_path
    fill_in "コンテンツ", with: "This is a test post."
    click_button "保存"
    expect(page).to have_content("投稿を作成しました。")
    expect(page).to have_content("This is a test post.")
  end
  it "post詳細ページに遷移すること" do
    visit post_path(post)
    expect(page).to have_content("This is a test post.")
  end
  it "postが更新されること" do
    visit edit_post_path(post)
    fill_in "コンテンツ", with: "This is an updated test post."
    click_button "保存"
    expect(page).to have_content("投稿を更新しました。")
    expect(page).to have_content("This is an updated test post.")
  end
  it "postが削除されること" do
    visit post_path(post)
    click_link "削除"
    expect(page).to have_content("投稿を削除しました。")
    expect(page).not_to have_content("This is a test post.")
  end
  it "空の投稿を作成しようとしたときにエラーメッセージが表示されること" do
    visit new_post_path
    fill_in "コンテンツ", with: ""
    click_button "保存"
    expect(page).to have_content("本文を入力してください")
  end
  it "空の投稿を更新しようとしたときにエラーメッセージが表示されること" do
    visit edit_post_path(post)
    fill_in "コンテンツ", with: ""
    click_button "保存"
    expect(page).to have_content("本文を入力してください")
  end
  it "200文字以上の投稿を作成しようとしたときにエラーメッセージが表示されること" do
    visit new_post_path
    fill_in "コンテンツ", with: "a" * 201
    click_button "保存"
    expect(page).to have_content("本文は200文字以内で入力してください")
  end
end
