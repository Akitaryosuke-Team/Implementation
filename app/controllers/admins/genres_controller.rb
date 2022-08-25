class Admins::GenresController < ApplicationController
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admins_genres_path
  end

  def index
    @genres = Genre.all
  end

  def edit
  end

  private
  def genre_params
    params.permit(:name)
  end
end
