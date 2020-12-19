def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie
    .select(:title, :id)
    .joins(:actors)
    .group(:id)
    .where(actors: {name: those_actors})
    .having('COUNT(*) = ?', those_actors.length)
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .select('CAST(floor(yr/10) AS INT)*10 AS decade')
    .group('decade')
    .order('AVG(score) DESC')
    .limit(1)
    .first
    .decade
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  Actor
    .select(:name)
    .joins('castings AS unnamed_castings ON actors.id = unnamed_castings.id')
    .joins('castings AS named_castings ON unnamed_castings.movie_id = named_castings.movie_id')
    .joins('actors AS named_actor ON named_actor.id = named_castings.actor_id')
    .where('named_actor.name = ?', name)
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .left_outer_joins(:movies)
    .where(movies: {id: nil})
    .length
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
