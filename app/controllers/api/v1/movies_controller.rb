class Api::V1::MoviesController < ApiController
  before_action :set_movie

  def show
    # render json: {
    #   movies: [
    #     {
    #       id: @movie.id,
    #       title: @movie.title
    #     }
    #   ]
    # }
    @movies = Movie.all
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
