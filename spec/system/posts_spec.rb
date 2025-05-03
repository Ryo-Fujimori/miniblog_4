require 'rails_helper'

RSpec.describe "Posts", type: :system do
  # 投稿作成
  let(:post) { Post.create(content: "This is a test post.") }

  before do
    driven_by(:rack_test)
  end
  # ポストが作成されることを確認する
  it "creates a post" do
    visit new_post_path
    fill_in "コンテンツ", with: "This is a test post."
    click_button "保存"
    expect(page).to have_content("Post was successfully created.")
    expect(page).to have_content("This is a test post.")
  end
  # post詳細ページに遷移することを確認する
  it "shows a post" do
    visit post_path(post)
    expect(page).to have_content("This is a test post.")
  end
  # postが更新されることを確認する
  it "updates a post" do
    visit edit_post_path(post)
    fill_in "コンテンツ", with: "This is an updated test post."
    click_button "保存"
    expect(page).to have_content("Post was successfully updated.")
    expect(page).to have_content("This is an updated test post.")
  end
  # postが削除されることを確認する
  it "destroys a post" do
    visit post_path(post)
    click_link "削除"
    expect(page).to have_content("Post was successfully destroyed.")
    expect(page).not_to have_content("This is a test post.")
  end
  # contentが空の投稿を作成しようとしたときにエラーメッセージが表示されることを確認する
  it "does not create a post with empty content" do
    visit new_post_path
    fill_in "コンテンツ", with: ""
    click_button "保存"
    expect(page).to have_content("Contentを入力してください")
  end
  # contentが空の投稿を更新しようとしたときにエラーメッセージが表示されることを確認する
  it "does not update a post with empty content" do
    visit edit_post_path(post)
    fill_in "コンテンツ", with: ""
    click_button "保存"
    expect(page).to have_content("Contentを入力してください")
  end
  # contentが200文字以上の投稿を作成しようとしたときにエラーメッセージが表示されることを確認する
  it "does not create a post with content over 200 characters" do
    visit new_post_path
    fill_in "コンテンツ", with: "a" * 201
    click_button "保存"
    expect(page).to have_content("Contentは200文字以内で入力してください")
  end
end
