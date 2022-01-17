# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
20.times do
  post = Post.create(content: Faker::Quotes::Shakespeare.hamlet_quote)
  20.times do
    comment = Comment.create(content: Faker::Movies::StarWars.quote, parent: post)
    5.times do
      s_comment = Comment.create(content: Faker::Movies::HarryPotter.quote, parent: comment)
      3.times do
        Comment.create(content: Faker::TvShows::GameOfThrones.quote, parent: s_comment)
      end
    end
  end
end

