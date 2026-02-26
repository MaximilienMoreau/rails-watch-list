# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require "json"

Bookmark.destroy_all
Review.destroy_all
List.destroy_all
Movie.destroy_all

# Movies via proxy TMDB
url = "https://tmdb.lewagon.com/movie/top_rated"
json = JSON.parse(URI.open(url).read)

json["results"].first(20).each do |m|
  Movie.create!(
    title: m["title"],
    overview: m["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{m["poster_path"]}",
    rating: m["vote_average"]
  )
end

# Lists
classic = List.create!(name: "Classic movies", photo_url: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?auto=format&fit=crop&w=1400&q=80")
superhero = List.create!(name: "Superhero", photo_url: "https://images.unsplash.com/photo-1517602302552-471fe67acf66?auto=format&fit=crop&w=1400&q=80")

# Bookmarks examples
Bookmark.create!(list: classic, movie: Movie.first, comment: "Top rated on IMDB")
Bookmark.create!(list: superhero, movie: Movie.second, comment: "Recommended by John")

# Reviews examples
Review.create!(list: classic, comment: "Seems like an interesting list of movies! Will give it a go thanks", rating: 4)
Review.create!(list: classic, comment: "I highly recommend both movies they're great!", rating: 5)

puts "Seed done: #{Movie.count} movies, #{List.count} lists"
