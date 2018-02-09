require_relative("../db/sql_runner")

class MovieStar

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO movie_star (first_name, last_name) VALUES ($1, $2) RETURNING id"
    values = [@first_name, @last_name]
    movie_star = SqlRunner.run( sql, values)[0]
    @id = movie_star['id'].to_i

  end

  def movie()
    sql = "SELECT * FROM movie INNER JOIN casting ON movie.id = casting.movie_id WHERE movie_star_id = $1"
    values = [@id]
    casting = SqlRunner.run(sql, values)
    return casting.map {|cast| Movie.new(cast)}


  end

def self.all()
  sql = "SELECT * FROM movie_star"
  movie_star = SqlRunner.run(sql, values)
  result = movie_star.map { |movie_star| MovieStar.new( location)}
  return result

end

def self.delete_all()
  sql = "DELETE FROM movie_star"
  values = []
  SqlRunner.run( sql, values)

end


end
