class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: %i[create destroy]

  def create
    Like.create!(user: current_user, movie: @movie)

    redirect_to @movie
  end

  def destroy
    like = @movie.likes.find(params[:id])
    like.destroy!

    redirect_to @movie
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
