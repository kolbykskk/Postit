require 'random_data'

#Seeds for topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

#Seeds for post db
50.times do
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
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
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

#Seeds for advertisement db
50.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph
  )
end

puts 'Seed finished'
puts "#{Advertisement.count} ads created"
