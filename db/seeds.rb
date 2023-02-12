# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
    puts "Destroying tables..."
    Member.destroy_all
    Server.destroy_all
    Friendship.destroy_all
    User.destroy_all

    puts "Resetting primary keys..."
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('friendships')
    ApplicationRecord.connection.reset_pk_sequence!('servers')
    ApplicationRecord.connection.reset_pk_sequence!('members')

    puts "Creating users..."

    User.create!(
      username: 'zaus', 
      email: 'zaus@zaus.io', 
      password: 'zausbaus'
    )

    User.create!(
      username: 'ayce', 
      email: 'ayce@lacap.io', 
      password: 'zausbaus'
    )

    User.create!(
      username: 'kinka', 
      email: 'kinka@tse.io', 
      password: 'zausbaus'
    )

    User.create!(
      username: 'kyle', 
      email: 'kyle@ginzburg.io', 
      password: 'zausbaus'
    )

    User.create!(
      username: 'peter', 
      email: 'peter@peter.io', 
      password: 'zausbaus'
    )

    User.create!(
      username: 'spencer', 
      email: 'spencer@iascone.io', 
      password: 'zausbaus'
    )

    User.create!(
      username: 'walker', 
      email: 'walker@walker.io', 
      password: 'zausbaus'
    )

    puts "Creating friendships..."
    
    Friendship.create!(
      user_id: 1,
      friend_id: 2
      
    )

    Friendship.create!(
      user_id: 2,
      friend_id: 1
    )

    Friendship.create!(
      user_id: 1,
      friend_id: 3
    )

    Friendship.create!(
      user_id: 3,
      friend_id: 1
    )

    Friendship.create!(
      user_id: 1,
      friend_id: 4
    )

    Friendship.create!(
      user_id: 4,
      friend_id: 1
    )

    Friendship.create!(
      user_id: 1,
      friend_id: 5
    )

    Friendship.create!(
      user_id: 5,
      friend_id: 1
    )

    puts "Creating servers..."
    
    Server.create!(
      server_name: "aA",
      owner_id: 1
    )

    puts "Creating members..."

    Member.create!(
      member_id: 1,
      server_id: 1,
      owner: true
    )

    Member.create!(
      member_id: 2,
      server_id: 1,
      owner: false
    )

    puts "Done!"
    
end