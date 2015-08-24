require 'faker'

# Create Topics
15.times do
  Topic.create!(
    title:         Faker::Lorem.word
  )
end
topics = Topic.all

#Create bookmarks
50.times do
  Bookmark.create!(
    topic:  topics.sample,
    url:    Faker::Internet.url
  )
end
bookmarks = Bookmark.all  

puts "Seed finished"
puts "#{Bookmark.count} bookmarks created!"
puts "#{Topic.count} bookmarks created!"