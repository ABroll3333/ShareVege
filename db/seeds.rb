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

kentaro = User.find_or_create_by!(email: "kentaro@example.com") do |user|
  user.name = "Kentaro"
  user.password = "password"
  user.postal_code = "postal_code"
  user.address = "address"
  user.phone_number = "phone_number"
end

ayumi = User.find_or_create_by!(email: "ayumi@example.com") do |user|
  user.name = "Ayumi"
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
  post.tag = "人参"
end

Post.find_or_create_by!(title: "トマトができました") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpeg"), filename:"sample-post2.jpeg")
  post.user = james
  post.item = "item"
  post.amount = "amount"
  post.address = "address"
  post.introduction = "introduction"
  post.tag = "ミニトマト"
end

Post.find_or_create_by!(title: "ブロッコリーがもうすぐできるよ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpeg"), filename:"sample-post3.jpeg")
  post.user = james
  post.item = "item"
  post.amount = "amount"
  post.address = "address"
  post.introduction = "introduction"
  post.tag = "ブロッコリー"
end

Post.find_or_create_by!(title: "人参販売中！！") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpeg"), filename:"sample-post4.jpeg")
  post.user = olivia
  post.item = "item"
  post.amount = "amount"
  post.address = "address"
  post.introduction = "introduction"
  post.tag = "人参"
end

Post.find_or_create_by!(title: "白菜これでよければどうぞ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpeg"), filename:"sample-post5.jpeg")
  post.user = olivia
  post.item = "item"
  post.amount = "amount"
  post.address = "address"
  post.introduction = "introduction"
  post.tag = "白菜"
end

Post.find_or_create_by!(title: "自然薯でとろろ汁") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpeg"), filename:"sample-post6.jpeg")
  post.user = olivia
  post.item = "item"
  post.amount = "amount"
  post.address = "address"
  post.introduction = "introduction"
  post.tag = "自然薯"
end

admin = Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = "password"
end

