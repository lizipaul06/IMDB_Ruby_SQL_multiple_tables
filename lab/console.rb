require('pry')
require_relative( 'models/casting')
require_relative( 'models/movie')
require_relative( 'models/star')

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

movie1 = Movie.new({'title'=> 'la la land', 'genre' => 'musical'})
movie2 = Movie.new({'title'=> 'the Shinning', 'genre' => 'horror'})
movie3 = Movie.new({'title'=> 'titanic', 'genre' => 'romance'})
movie4 = Movie.new({'title'=> 'Superbad', 'genre' => 'comedy'})
#
movie1.save
movie2.save
movie3.save
movie4.save


star1 = Star.new({'first_name' => 'Emma', 'last_name' => 'Stone'})
star2 = Star.new({'first_name' => 'Jack', 'last_name' => 'Torrance'})
star3 = Star.new({'first_name' => 'Leo', 'last_name' => 'DiCaprio'})
star1.save
star2.save
star3.save

#
casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 100})
casting2 = Casting.new({'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => 1000000})
casting3 = Casting.new({'movie_id' => movie3.id, 'star_id' => star3.id, 'fee' => 5})
casting1.save
casting2.save
casting3.save

casting1.fee = 400
casting1.update()

binding.pry
star1.movies()
nil
