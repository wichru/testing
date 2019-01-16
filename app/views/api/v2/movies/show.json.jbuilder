json.movie do
  json.id @movie.id
  json.title @movie.title
  json.genre do
    json.id @movie.genre.id
    json.name @movie.genre.name
    json.number_of_movies @genre.movies.count
  end
end
