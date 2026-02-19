class BookmarksController < ApplicationController
  def new
    @movies = Movie.all
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to @list
    else
      # @movies = Movie.all
      @lists = List.all
    @movies = Movie.all
      render "lists/index", status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private
  def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
