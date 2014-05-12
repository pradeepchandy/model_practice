class QuestionsController < ApplicationController
  def question_1
    # What is the most recent movie on the list that the second actor appeared in?

    # Your Ruby goes here.


   @most_recent_movie_for_second_actor = Actor.second.movies.order("year DESC").first.title


  end

  def question_2
    # Who directed the longest movie on the list?

    # Your Ruby goes here.

  @director_of_longest_movie = Director.find(Movie.order("duration desc").first.director_id).name

  end

  def question_3
    # Which director has the most movies on the list?

movie_counts = Hash.new

    Director.all.each do |the_director|
      number_of_movies_directed_by_the_director = the_director.movies.count
      movie_counts =  movie_counts.merge(the_director.name =>number_of_movies_directed_by_the_director)
    end

     @director_with_the_most_movies = movie_counts.sort_by{|k,v| v}.reverse.first[0]
  end

  def question_4
    # Which actor has been in the most movies on the list?
     movie_counts = Hash.new

    Actor.all.each do |the_actor|
      movie_counts =  movie_counts.merge(the_actor.name =>the_actor.movies.count)
    end

     @actor_with_the_most_movies = movie_counts.sort_by{|k,v| v}.reverse.first[0]
  end




  def question_5
    # This one is hard. Work on it after all your other review is complete.

    # Which actor/director pair has the most movies on the list?
    # (If there's a tie, any pair of them is fine)

    # Your Ruby goes here.

   movies_for_pair = Hash.new

    Movie.all.each do |the_movie|

       the_movie.actors.all.each do |the_actor|

     movies_for_pair =  movies_for_pair.merge([the_actor.name, the_movie.director.name] => the_movie.title)

end
end

     @movies_for_pair = movies_for_pair.count



     #@actor = movies_for_pair[]
    # @director = sdfd
    # @movies_together = dfd

  end
end
