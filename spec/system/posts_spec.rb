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
    fill_in "Content", with: "This is a test post."
    click_button "Create Post"
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
    fill_in "Content", with: "This is an updated test post."
    click_button "Update Post"
    expect(page).to have_content("Post was successfully updated.")
    expect(page).to have_content("This is an updated test post.")
  end
  # postが削除されることを確認する
  it "destroys a post" do
    visit post_path(post)
    click_link "Destroy"
    expect(page).to have_content("Post was successfully destroyed.")
    expect(page).not_to have_content("This is a test post.")
  end
  # contentが空の投稿を作成しようとしたときにエラーメッセージが表示されることを確認する
  it "does not create a post with empty content" do
    visit new_post_path
    fill_in "Content", with: ""
    click_button "Create Post"
    expect(page).to have_content("Post was not created.")
    expect(page).to have_content("Content can't be blank")
  end
  # contentが空の投稿を更新しようとしたときにエラーメッセージが表示されることを確認する
  it "does not update a post with empty content" do
    visit edit_post_path(post)
    fill_in "Content", with: ""
    click_button "Update Post"
    expect(page).to have_content("Post was not updated.")
    expect(page).to have_content("Content can't be blank")
  end
  # contentが200文字以上の投稿を作成しようとしたときにエラーメッセージが表示されることを確認する
  it "does not create a post with content over 200 characters" do
    visit new_post_path
    fill_in "Content", with: "a" * 201
    click_button "Create Post"
    expect(page).to have_content("Post was not created.")
    expect(page).to have_content("Content is too long (maximum is 200 characters)")
  end
end
