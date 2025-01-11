# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Follow.destroy_all
Share.destroy_all
Like.destroy_all
Comment.destroy_all
UserInterest.destroy_all
Post.destroy_all
Interest.destroy_all
User.destroy_all
# Create some users with unique emails and passwords
user1 = User.create!(username: 'john_doe', first_name: 'John', last_name: 'Doe', bio: 'Lover of tech and photography.', email: 'john@example.com', password: 'password123')
user2 = User.create!(username: 'jane_smith', first_name: 'Jane', last_name: 'Smith', bio: 'Adventurer and traveler.', email: 'jane@example.com', password: 'password123')

# Create some interests with unique titles
interest1 = Interest.create!(title: 'Photography')
interest2 = Interest.create!(title: 'Traveling')
interest3 = Interest.create!(title: 'Coding')

# Create user interests (associating users with interests)
UserInterest.create!(user_id: user1.id, interest_id: interest1.id)
UserInterest.create!(user_id: user1.id, interest_id: interest2.id)
UserInterest.create!(user_id: user2.id, interest_id: interest3.id)

# Create some posts
post1 = Post.create!(user: user1, content: 'Just took some amazing photos of the sunset!')
post2 = Post.create!(user: user2, content: 'Exploring the world one city at a time.')

# Create likes
Like.create!(user: user1, post: post2)
Like.create!(user: user2, post: post1)

# Create shares
Share.create!(post_id: post1.id)
Share.create!(post_id: post2.id)

# Create some comments
Comment.create!(user: user1, post: post2, content: 'Such an inspiring post!')
Comment.create!(user: user2, post: post1, content: 'Amazing photos, I want to learn photography!')

# Create followers (for the follow relationship)
Follow.create!(follower_id: user1.id, followed_id: user2.id)
Follow.create!(follower_id: user2.id, followed_id: user1.id)

puts "Seed data created successfully."
