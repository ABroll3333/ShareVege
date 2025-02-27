# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.postal_code = "postal_code"
  user.address = "address"
  user.phone_number = "phone_number"
end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.postal_code = "postal_code"
  user.address = "address"
  user.phone_number = "phone_number"
end

Post.find_or_create_by!(title: "人参ができました") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpeg"), filename:"sample-post1.jpeg")
  post.user = olivia
  post.item = "item"
  post.amount = "amount"
  post.address = "address"
  post.introduction = "introduction"
end

Post.find_or_create_by!(title: "トマトができました") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpeg"), filename:"sample-post2.jpeg")
  post.user = james
  post.item = "item"
  post.amount = "amount"
  post.address = "address"
  post.introduction = "introduction"
end

admin = Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password"
end

Tag.create([
  {name: '人参'},
  {name: 'きゅうり'},
  {name: 'なす'},
  {name: 'キャベツ'},
  {name: 'ジャガイモ'},
  {name: '白菜'},
  {name: '長ネギ'},
  {name: '青ネギ'},
  {name: '長芋'},
  {name: 'ブロッコリー'},
  {name: 'さつまいも'},
  {name: '小松菜'},
  {name: 'ほうれん草'},
  {name: '水菜'},
  {name: '大根'},
  {name: '椎茸'},
  {name: '春菊'},
  {name: 'たけのこ'},
  {name: 'タマネギ'},
  {name: 'トマト'},
  {name: 'ミニトマト'},
  {name: 'にら'},
  {name: '枝豆'},
  {name: 'にんにく'},
  {name: 'モロヘイヤ'},
  {name: 'レンコン'},
  {name: 'レタス'},
  {name: 'パプリカ'},
  {name: 'オクラ'},
])