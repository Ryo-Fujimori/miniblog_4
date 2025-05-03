# ポストを100件作成
100.times do
  Post.create!(
    content: Faker::Lorem.paragraph
  )
end
