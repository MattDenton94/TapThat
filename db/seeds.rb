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
# db/seeds.rb

# db/seeds.rb

# Clear existing data
User.destroy_all
Post.destroy_all
Like.destroy_all
Comment.destroy_all
# Follow.destroy_all
Share.destroy_all
UserInterest.destroy_all

# Create users
users = User.create!([
  { username: "johndoe", first_name: "John", last_name: "Doe", bio: "Lover of technology and photography.", email: "johndoe@example.com", password: "password123" },
  { username: "janedoe", first_name: "Jane", last_name: "Doe", bio: "Avid traveler and food blogger.", email: "janedoe@example.com", password: "password123" },
  { username: "admin", first_name: "Admin", last_name: "User", bio: "Here to manage things.", email: "admin@example.com", password: "password123" }
])

# Create posts
posts = Post.create!([
  { user: users[0], content: "My first post!" },
  { user: users[1], content: "Enjoying a sunny day at the beach." },
  { user: users[0], content: "Check out my latest photo series." }
])

# Create likes
likes = Like.create!([
  { user: users[1], post: posts[0] },
  { user: users[0], post: posts[1] }
])

# Create comments
comments = Comment.create!([
  { user: users[1], post: posts[0], content: "Great post!" },
  { user: users[0], post: posts[1], content: "Looks amazing!" }
])

# # Create follows
# follows = Follow.create!([
#   { follower: users[0], followed: users[1] },
#   { follower: users[1], followed: users[0] }
# ])

# Create shares
shares = Share.create!([
  { user: users[0], post: posts[1] },
  { user: users[1], post: posts[0] }
])

# Create user interests
user_interests = UserInterest.create!([
  { user: users[0], title: "Photography" },
  { user: users[1], title: "Traveling" },
  { user: users[0], title: "Tech Gadgets" }
])

puts "Seeding complete!"
