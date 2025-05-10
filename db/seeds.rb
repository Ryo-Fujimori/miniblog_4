# 管理者ユーザーを作成
admin_user = User.create!(
  email: "admin@init.com",
  password: "password",
  password_confirmation: "password"
)

# 一般ユーザーを10件作成
# Emailはユニークで作成
10.times do |n|
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password"
  )
  # ポストを10件作成
  10.times do
    user.posts.create!(
      content: Faker::Lorem.paragraph
    )
  end
end
