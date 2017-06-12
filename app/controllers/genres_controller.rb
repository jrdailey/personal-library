class GenresController < ApplicationController
  before_action :set_genre, only: :destroy

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      render json: { status: :ok, id: @genre.id }
    else
      render json: { status: :internal_server_error }
    end
  end

  def destroy
    Book.where(genre_id: @genre).destroy_all
    @genre.destroy

    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_genre
      @genre = Genre.find(params[:id])
    end

    def genre_params
      params.require(:genre).permit(:name)
    end
end
