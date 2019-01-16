class Api::V1::MoviesController < ApplicationController
  before_action :set_movie

  def show; end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
