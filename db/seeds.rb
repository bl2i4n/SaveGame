require 'random_data'

10.times do
  Topic.create!(
    title: RandomData.random_sentence,
  )
end
topics = Topic.all

10.times do
  Bookmark.create!(
    url: RandomData.random_sentence,
  )
end
bookmarks = Bookmark.all

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
