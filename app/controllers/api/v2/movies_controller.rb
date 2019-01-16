class Api::V2::MoviesController < ApplicationController
  before_action :set_data

  def show; end

  private

  def set_data
    @movie = Movie.find(params[:id])
    @genre = Genre.find(params[:id])
  end
end
