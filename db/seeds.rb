# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Example:
# #
# #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# #     MovieGenre.find_or_create_by!(name: genre_name)
# #   end

# # db/seeds.rb

# # db/seeds.rb

# # db/seeds.rb

# # db/seeds.rb
# Clear existing data
Message.destroy_all
Share.destroy_all
Like.destroy_all
Follow.destroy_all
PostInterest.destroy_all
UserInterest.destroy_all
Post.destroy_all
Interest.destroy_all
User.destroy_all

# Users
users = User.create!([
  { email: 'alice@example.com', password: 'password', username: 'alice123', bio: 'I love hiking and photography.' },
  { email: 'bob@example.com', password: 'password', username: 'bob_the_builder', bio: 'Carpenter by day, gamer by night.' },
  { email: 'charlie@example.com', password: 'password', username: 'charlie', bio: 'Tech enthusiast and foodie.' }
])

# Interests
interests = Interest.create!([
  { name: 'Hiking', description: 'Exploring trails and enjoying nature.' },
  { name: 'Gaming', description: 'Video games and esports.' },
  { name: 'Photography', description: 'Capturing moments through a lens.' }
])

# User Interests
UserInterest.create!([
  { user_id: users[0].id, interest_id: interests[0].id },
  { user_id: users[0].id, interest_id: interests[2].id },
  { user_id: users[1].id, interest_id: interests[1].id },
  { user_id: users[2].id, interest_id: interests[0].id },
  { user_id: users[2].id, interest_id: interests[1].id }
])

# Posts
posts = Post.create!([
  { content: 'Check out this beautiful sunset!', media_url: 'https://example.com/sunset.jpg', user_id: users[0].id },
  { content: 'Finally finished building my desk!', media_url: 'https://example.com/desk.jpg', user_id: users[1].id },
  { content: 'Latest tech trends you need to know!', media_url: nil, user_id: users[2].id }
])

# Post Interests
PostInterest.create!([
  { post_id: posts[0].id, interest_id: interests[2].id },
  { post_id: posts[1].id, interest_id: interests[1].id },
  { post_id: posts[2].id, interest_id: interests[0].id }
])

# Likes
Like.create!([
  { user_id: users[1].id, post_id: posts[0].id },
  { user_id: users[2].id, post_id: posts[0].id },
  { user_id: users[0].id, post_id: posts[1].id }
])

# Shares
Share.create!([
  { user_id: users[1].id, post_id: posts[0].id },
  { user_id: users[2].id, post_id: posts[1].id }
])

# Messages
Message.create!([
  { content: 'Hey, great post about hiking!', user_id: users[2].id },
  { content: 'Thanks for sharing this tech trend!', user_id: users[0].id }
])

# Follows
Follow.create!([
  { follower_id: users[0].id, following_id: users[1].id },
  { follower_id: users[1].id, following_id: users[2].id },
  { follower_id: users[2].id, following_id: users[0].id }
])
