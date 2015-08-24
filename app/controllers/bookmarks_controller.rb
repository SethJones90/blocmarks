class BookmarksController < ApplicationController

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
  end

  def create
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:url))
    if @bookmark.save
      flash[:notice] = "This bookmark was successfully saved."
      redirect_to @bookmark
    else
      flash[:error] = "There was an error saving this bookmark. Please try again."
    end
  end

  def destroy

  end
end
