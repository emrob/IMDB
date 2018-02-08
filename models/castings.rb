require_relative("../db/sql_runner")

class Casting

  attr_reader :id
  attr_accessor :movie_star_id, :movie_id, :fee

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_star_id = options['movie_star_id']
    @movie_id = options['movie_id']
    @fee = options['fee'].to_i
  end

  def save()
    sql = "INSERT INTO casting (movie_star_id, movie_id, fee) VALUES ($1, $2, $3) RETURNING id"
    values = [@movie_star_id, @movie_id, @fee]
    casting = SqlRunner.run(sql, values).first
    @id = casting['id'].to_i

  end

 def movie()
   sql = "SELECT * FROM movie WHERE id = $1"
   values = [@movie_id]
   movie = SqlRunner.run(sql, values)[0]
   return Movie.new(movie)

 end

 def movie_star()
   sql = "SELECT * FROM movie_star WHERE id = $1"
   values = [@movie_star_id]
   movie_star = SqlRunner.run( sql, values)[0]
   return MovieStar.new(movie_star)
 end


  def self.all()
    sql = "SELECT * FROM casting"
    casting = SqlRunner.run(sql, values)
    result = casting.map { |casting| Casting.new( casting)}
    return result
  end

    def self.delete_all()
      sql = "DELETE FROM casting"
      values = []
      SqlRunner.run(sql, values)

    end

  end
