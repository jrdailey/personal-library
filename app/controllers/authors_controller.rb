class AuthorsController < ApplicationController
  before_action :set_author, only: :destroy

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      render json: { status: :ok, id: @author.id }
    else
      render json: { status: :internal_server_error }
    end
  end

  def destroy
    Book.where(author_id: @author).destroy_all
    @author.destroy

    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
end
