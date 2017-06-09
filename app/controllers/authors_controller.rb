class AuthorsController < ApplicationController
  before_action :set_author, only: [:edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      render json: { status: :ok, id: @author.id }
    else
      render json: { status: :internal_server_error }
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to authors_url, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
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
