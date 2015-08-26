class BookmarksController < ApplicationController

  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:url))
    @bookmark.user = current_user
    @bookmark.topic = @topic
    authorize @bookmark
    if @bookmark.save
      flash[:notice] = "This bookmark was successfully saved."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error saving this bookmark. Please try again."
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Bookmark was successfully deleted."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the bookmark. Please try again."
      render :show
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      flash[:notice] = "Bookmark was updated"
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error updating the bookmark. Please try again."
      render :new
    end

  end
end
