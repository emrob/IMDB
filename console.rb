require_relative( 'models/movies')
require_relative( 'models/castings')
require_relative( 'models/moviestars')

require( 'pry-byebug')

Casting.delete_all()
Movie.delete_all()
MovieStar.delete_all()

movie1 = Movie.new({
  'title' => 'The Beach',
  'genre' => 'Adventure, Drama',
  'rating' => '6'
  })
movie1.save()

movie2 = Movie.new({
  'title' => 'Forest Gump',
  'genre' => 'Drama, Romance',
  'rating' => '9'
  })
movie2.save()


movie_star1 = MovieStar.new({
  'first_name' => 'Leonardo',
  'last_name' => 'Decaprio'
  })
movie_star1.save()

movie_star2 = MovieStar.new({
  'first_name' => 'Tom',
  'last_name' => 'Hanks'
  })
movie_star2.save()


casting1 = Casting.new({ 'movie_id' => movie2.id, 'movie_star_id' => movie_star2.id, 'fee' => '100000' })
casting1.save()


binding.pry
nil
