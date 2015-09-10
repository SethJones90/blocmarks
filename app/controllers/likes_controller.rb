class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like

    if like.save
      flash[:notice] = "You successfully liked this bookmark!"
    else
      flash[:error] = "An error occured while trying to like this bookmark. Please try again."
    end

    redirect_to request.referer
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    authorize like

    if like.destroy
      flash[:notice] = "You successfully unliked this bookmark"
    else
      flash[:error] = "An error occured while trying to unlike this bookmark. Please try again."
    end
    
    redirect_to request.referer
  end

end
