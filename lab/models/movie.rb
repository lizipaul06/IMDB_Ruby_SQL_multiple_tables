require_relative("../db/sql_runner")


class Movie

  attr_reader :id
  attr_accessor :title, :genre

    def initialize(options)
      @id = options['id'].to_i if options ['id']
      @genre = options['genre']
      @title = options['title']
    end

    def save ()
      sql = "INSERT INTO movies (
      genre,
      title
      ) VALUES ($1, $2) RETURNING id"
      values = [@genre, @title]
      movie = SqlRunner.run(sql, values).first
      @id = movie['id'].to_i
  end

  def self.all
      sql = "SELECT * FROM movies"
      movies = SqlRunner.run(sql)
      result = movies.map {|movie| Movie.new (movie)}
      return result
  end

  def delete()
    sql = "DELETE FROM movies where id =$1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE castings SET (genre, title) = ($1, $2)
     WHERE id = $3"
     values = [@genre, @title, @id]
    result = SqlRunner.run(sql, values)
  end



end
