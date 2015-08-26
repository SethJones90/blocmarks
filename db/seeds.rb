require 'faker'

#Create Users
5.times do 
  user = User.new(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Topics
15.times do
  Topic.create!(
    user:          users.sample,
    title:         Faker::Lorem.word
  )
end
topics = Topic.all

#Create bookmarks
50.times do
  Bookmark.create!(
    user:  users.sample,
    topic:  topics.sample,
    url:    Faker::Internet.url
  )
end
bookmarks = Bookmark.all  

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'sethjmusic@gmail.com',
  password: 'helloworld'
 )

puts "Seed finished"
puts "#{Bookmark.count} bookmarks created!"
puts "#{Topic.count} bookmarks created!"