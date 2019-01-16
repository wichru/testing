# json.id @movie.id
# json.title @movie.title

json.movies @movies do |movie|
  json.id movie.id
  json.title movie.title
end
