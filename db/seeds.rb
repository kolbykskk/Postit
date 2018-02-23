require 'random_data'

# Create Users
5.times do
  User.create!(
  name:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

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
    user: users.sample,
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

unique_post = Post.find_or_create_by!(user: users.sample, topic: topics.sample, title: "Unique title", body: "Unique body >= 20 chars")
Comment.find_or_create_by!(post: unique_post, body: "Unique body")

user = User.first
user.update_attributes!(
  email: 'kolbykalafut@gmail.com',
  password: 'helloworld'
)

puts 'Seed finished'
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
