require 'random_data'

#Seeds for post db
50.times do
  Post.create!(
    title: RandomData.random_sentance,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

unique_post = Post.find_or_create_by!(title: "Unique title", body: "Unique body")
Comment.find_or_create_by!(post: unique_post, body: "Unique body")

puts 'Seed finished'
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

#Seeds for advertisement db
50.times do
  Advertisement.create!(
    title: RandomData.random_sentance,
    copy: RandomData.random_paragraph
  )
end

puts 'Seed finished'
puts "#{Advertisement.count} ads created"
