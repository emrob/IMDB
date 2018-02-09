require_relative("../db/sql_runner")

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :rating

def initialize(options)
  @title = options['title']
  @genre = options['genre']
  @rating = options['rating'].to_i
  @id = options['id'].to_i if options['id']

end

def save()
sql = "INSERT INTO movie (title, genre, rating) VALUES ($1, $2, $3) RETURNING id"
values = [@title, @genre, @rating]
movie = SqlRunner.run(sql, values).first
@id = movie['id'].to_i
end

# def update()
#   sql = "UPDATE movie SET title = $1 WHERE id = $2"
#   values = [@title, @genre, ]
#   SqlRunner.run(sql, values)
#
# end

def self.all()
  sql = "SELECT * FROM movie"
  values = []
  movie = SqlRunner.run(sql, values)
  result = movie.map { |movie| Movie.new( movie )}
  return result
end

def self.delete_all()
  sql = "DELETE FROM movie"
  values = []
  SqlRunner.run(sql, values)
end

end
