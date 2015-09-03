class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like

    if like.save
      flash[:notice] = "You successfully liked this bookmark!"
      redirect_to @bookmark.topic
    else
      flash[:error] = "An error occured while trying to like this bookmark. Please try again."
      redirect_to @bookmark.topic
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    authorize like

    if like.destroy
      flash[:notice] = "You successfully unliked this bookmark"
      redirect_to @bookmark.topic
    else
      flash[:error] = "An error occured while trying to unlike this bookmark. Please try again."
      redirect_to @bookmark.topic
    end
  end

end
